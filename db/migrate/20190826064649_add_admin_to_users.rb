class AddAdminToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :admin, :boolean, default: false
    add_column :users, :superior1, :boolean, default: false
    add_column :users, :superior2, :boolean, default: false
  end
end
