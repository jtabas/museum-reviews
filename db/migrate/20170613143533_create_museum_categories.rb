class CreateMuseumCategories < ActiveRecord::Migration[5.1]
  def change
    create_table :museum_categories do |t|
      t.belongs_to :museum, index: true
      t.belongs_to :category, index: true

      t.timestamps
    end
  end
end
