class CreateDisks < ActiveRecord::Migration
  def up
    create_table :disks do |t|
      t.integer :server_id
      t.string :name
      t.string :size
      t.string :space_used
      t.string :space_available
      t.integer :percent_used
      t.string :mount_point

      t.timestamps
    end
  end

  def down
    drop_table :disks
  end
end
