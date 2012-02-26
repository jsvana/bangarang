require 'net/ssh'

class Movie < ActiveRecord::Base
	scope :by_title, order(:title).all

	self.per_page = 10

	def self.update_movies
		puts "[LOG] Updating movies..."

		begin
			Net::SSH.start('std.jsvana.com', 'ruby', password: 'gem') do |ssh|
				stdout = ""
				ssh.exec!("ls -R /media/bangarang/HD\\ Movies | grep -v '^\\/' | grep -v '^$' | grep -E '.mp4|.mkv|.avi'") do |channel, stream, data|
					stdout << data if stream == :stdout
				end

				data = stdout.split("\n")#[0...20]

				puts "[LOG] #{data}"

				Movie.delete_all

				data.each do |datum|
					puts "[LOG] Attempting to add #{datum}"

					title = datum.gsub(/^(.*?)(\.(?:Extended))?\.\d{4}.*?\.(?:mp4|avi|mkv)$/, '\1').gsub(/\./, ' ')
					quality = datum.gsub(/^.*?(1080p|720p).*?$/, '\1')
					hd = false

					if quality == datum
						quality = ''
					else
						hd = true
					end

					search = Imdb::Search.new(title)

					begin
						movie = Imdb::Movie.new(search.movies[0].id)

						unless movie.poster.nil?
							m = Movie.where(title: movie.title)
							if m.length == 0
								Movie.create(imdb_id: movie.id, title: movie.title, year: movie.year, description: movie.plot, director: movie.director[0], runtime: movie.length, rating: "#{movie.rating}", cover_url: movie.poster, definition: "#{quality}:#{datum}", hd: hd, filename: datum)
							else
								#m.update_attributes(definition: quality)#m.definition + "," + quality)
								m[0].definition += ",#{quality}:#{datum}"
								m[0].save
							end
						end
					rescue StandardError => e
						puts "[LOG] Unable to add movie \"#{datum}\", error: #{e.to_s}"
					end
				end
			end
		rescue StandardError => e
					puts e.to_s
				end

		puts "[LOG] Update complete."
	end

	def self.search(search)
		search_condition = "%" + search + "%"
		find(:all, :conditions => ['title LIKE ?', search_condition])
	end
end
