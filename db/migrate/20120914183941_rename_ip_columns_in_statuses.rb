class RenameIpColumnsInStatuses < ActiveRecord::Migration
  def up
    rename_column :statuses, :local_ip, :ip
    rename_column :statuses, :local_ip6, :ip6
  end

  def down
    rename_column :statuses, :ip, :local_ip
    rename_column :statuses, :ip6, :local_ip6
  end
end
