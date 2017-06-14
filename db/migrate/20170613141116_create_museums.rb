class CreateMuseums < ActiveRecord::Migration[5.1]
  def change
    create_table :museums do |t|
      t.string :name, null: false
      t.string :description
      t.string :hours
      t.string :address, null: false
      t.float :admission

      t.timestamps
    end
  end
end
