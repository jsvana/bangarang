class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.integer :imdb_id
      t.string :title
      t.integer :year
      t.text :description
      t.string :director
      t.string :writer
      t.integer :runtime
      t.string :rating

      t.timestamps
    end
  end
end
