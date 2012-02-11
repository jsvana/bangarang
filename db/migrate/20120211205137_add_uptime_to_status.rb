class AddUptimeToStatus < ActiveRecord::Migration
  def change
  	add_column :statuses, :uptime, :string
  end
end
