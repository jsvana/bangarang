class CreateStatuses < ActiveRecord::Migration
  def change
    create_table :statuses do |t|
      t.integer :server_id
      t.boolean :up
      t.integer :ports_open
      t.string :ports

      t.timestamps
    end
  end
end
