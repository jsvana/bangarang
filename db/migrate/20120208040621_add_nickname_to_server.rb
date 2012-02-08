class AddNicknameToServer < ActiveRecord::Migration
  def change
    add_column :servers, :nickname, :string
  end
end
