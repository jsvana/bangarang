class AddLocalIpToStatuses < ActiveRecord::Migration
  def change
    add_column :statuses, :local_ip, :string
  end
end
