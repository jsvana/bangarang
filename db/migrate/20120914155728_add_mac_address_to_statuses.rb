class AddMacAddressToStatuses < ActiveRecord::Migration
  def change
    add_column :statuses, :mac_address, :string
  end
end
