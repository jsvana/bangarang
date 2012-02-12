class Movie < ActiveRecord::Base

	def self.update_movies
		search = Imdb::Search.new('Avatar')

		movie = Imdb::Movie.new(search.movies[0].id)

		puts movie.title
	end
end
