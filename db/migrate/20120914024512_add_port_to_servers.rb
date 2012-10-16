class AddPortToServers < ActiveRecord::Migration
  def change
    add_column :servers, :port, :integer
  end
end
