class AddIsMediaToServers < ActiveRecord::Migration
  def change
    add_column :servers, :is_media, :boolean, default: false
  end
end
