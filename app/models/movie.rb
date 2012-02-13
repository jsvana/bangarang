require 'net/ssh'

class Movie < ActiveRecord::Base
	scope :by_title, order(:title).all

	def self.update_movies
		puts "[LOG] Updating movies..."

		Net::SSH.start('std.jsvana.com', 'ruby', password: 'gem') do |ssh|
			stdout = ""
			ssh.exec!("ls /media/bangarang/HD\\ Movies") do |channel, stream, data|
				stdout << data if stream == :stdout
			end

			data = stdout.split("\n")

			puts "[LOG] #{data}"

			Movie.delete_all

			data.each do |datum|
				title = datum.gsub(/^(.*?)(\.(?:Extended))?\.\d{4}.*?\.(?:mp4|avi|mkv)$/, '\1').gsub(/\./, ' ')
				search = Imdb::Search.new(title)

				begin
					movie = Imdb::Movie.new(search.movies[0].id)

					puts "[LOG] #{movie.director}"

					unless movie.poster.nil?
						Movie.create(imdb_id: movie.id, title: movie.title, year: movie.year, description: movie.plot, director: movie.director[0], runtime: movie.length, rating: "#{movie.rating}", cover_url: movie.poster)
					end
				rescue
					puts "[LOG] Unable to add movie \"#{datum}\""
				end
			end
		end

		puts "[LOG] Update complete."
	end
end
