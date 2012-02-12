class CreateStatusData < ActiveRecord::Migration
  def change
    create_table :status_data do |t|
      t.integer :status_id
      t.integer :user_count
      t.integer :last_minute_load
      t.integer :last_five_load
      t.integer :last_fifteen_load

      t.timestamps
    end
  end
end
