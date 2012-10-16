class AddMemoryMonitoringToStatusData < ActiveRecord::Migration
  def change
    add_column :status_data, :total_memory, :integer
    add_column :status_data, :free_memory, :integer
    add_column :status_data, :used_memory, :integer
  end
end
