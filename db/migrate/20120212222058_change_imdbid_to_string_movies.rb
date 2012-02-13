class ChangeImdbidToStringMovies < ActiveRecord::Migration
  def up
  	change_column :movies, :imdb_id, :string
  end

  def down
  	change_column :movies, :imdb_id, :integer
  end
end
