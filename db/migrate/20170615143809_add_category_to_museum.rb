class AddCategoryToMuseum < ActiveRecord::Migration[5.1]
  def change
    add_column :museums, :category, :string
  end
end
