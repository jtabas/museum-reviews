class ChangeAddressToLocation < ActiveRecord::Migration[5.1]
  def change
    rename_column :museums, :address, :location
  end
end
