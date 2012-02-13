class AddFilenameToMovies < ActiveRecord::Migration
  def change
  	add_column :movies, :filename, :string
  end
end
