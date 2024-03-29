class CreateTracks < ActiveRecord::Migration
  def change
    create_table :tracks do |t|
      t.string :title
      t.integer :artist_id
      t.integer :album_id
      t.integer :track_number
      t.integer :disk_number

      t.timestamps
    end
  end
end
