class ChangeAdminToBoolean < ActiveRecord::Migration[5.1]
  def up
    remove_column :users, :admin
    add_column :users, :admin, :boolean, null: false, default: false
  end

  def down
    remove_column :users, :admin
    add_column :users, :admin, :string
  end
end
