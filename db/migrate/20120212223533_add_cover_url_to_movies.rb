class AddCoverUrlToMovies < ActiveRecord::Migration
  def change
  	add_column :movies, :cover_url, :string
  end
end
