class CreateAlbums < ActiveRecord::Migration
  def change
    create_table :albums do |t|
      t.string :name
      t.integer :artist_id
      t.integer :release_year

      t.timestamps
    end
  end
end
