require 'net/ssh'

class Track < ActiveRecord::Base
  has_one :artist
  has_one :album

  default_scope order(:track_number)

  def self.update_music
  	puts "[LOG] Updating music..."

		begin
			Net::SSH.start('std.jsvana.com', 'ruby', password: 'gem') do |ssh|
				stdout = ""
				ssh.exec!("./scan Music/") do |channel, stream, data|
					stdout << data if stream == :stdout
				end

				data = stdout.split("\n")

				puts "[LOG] #{data}"

				Artist.delete_all
				Album.delete_all
				Track.delete_all

				data.each do |datum|
					puts "[LOG] Attempting to add #{datum}..."
					info = datum.split("\t")

					filename = info[1]
					track_number = info[2]
					album_artist = info[3]
					album = info[4]
					year = info[5]
					track_artist = info[6]
					track = info[7]

					tmp_artist = Artist.find_or_create_by_name(name: track_artist)

					tmp_album = Album.find_or_create_by_name_and_artist_id(name: album, artist_id: tmp_artist.id, release_year: year)

					tmp_track = Track.create(title: track, artist_id: tmp_artist.id, album_id: tmp_album.id, track_number: track_number)
					puts tmp_track
				end

				

				# data.each do |datum|
				# 	puts "[LOG] Attempting to add #{datum}"

				# 	title = datum.gsub(/^(.*?)(\.(?:Extended))?\.\d{4}.*?\.(?:mp4|avi|mkv)$/, '\1').gsub(/\./, ' ')
				# 	quality = datum.gsub(/^.*?(1080p|720p).*?$/, '\1')
				# 	hd = false

				# 	if quality == datum
				# 		quality = ''
				# 	else
				# 		hd = true
				# 	end

				# 	search = Imdb::Search.new(title)

				# 	begin
				# 		movie = Imdb::Movie.new(search.movies[0].id)
				# 	rescue StandardError => e
				# 		puts "[LOG] Unable to add track \"#{datum}\", error: #{e.to_s}"
				# 	end
				# end
			end
		rescue StandardError => e
					puts e.to_s
				end

		puts "[LOG] Update complete."
	end
end
