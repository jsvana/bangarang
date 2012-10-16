class AddLocalIp6ToStatuses < ActiveRecord::Migration
  def change
    add_column :statuses, :local_ip6, :string
  end
end
