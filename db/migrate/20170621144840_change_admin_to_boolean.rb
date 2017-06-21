class ChangeAdminToBoolean < ActiveRecord::Migration[5.1]
  def up
    change_column :users, :admin, :boolean, null: false, default: false
  end

  def down
    change_column :users, :admin, :string
  end
end
