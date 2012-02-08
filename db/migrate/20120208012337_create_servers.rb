class CreateServers < ActiveRecord::Migration
  def change
    create_table :servers do |t|
      t.string :hostname
      t.string :domain
      t.string :ip

      t.timestamps
    end
  end
end
