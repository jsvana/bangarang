class AddUsernameAndPasswordToServers < ActiveRecord::Migration
  def change
    add_column :servers, :username, :string
    add_column :servers, :password, :string
  end
end
