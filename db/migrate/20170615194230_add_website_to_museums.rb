class AddWebsiteToMuseums < ActiveRecord::Migration[5.1]
  def change
    add_column :museums, :website, :string
    add_column :museums, :phone_number, :string
  end
end
