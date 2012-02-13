class AddDefinitionAndHdToMovies < ActiveRecord::Migration
  def change
  	add_column :movies, :definition, :string
  	add_column :movies, :hd, :boolean, default: false
  end
end
