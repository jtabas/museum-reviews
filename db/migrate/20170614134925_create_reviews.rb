class CreateReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :reviews do |t|
      t.integer :rating, null: false
      t.string :body
      t.integer :museum_id

      t.timestamps
    end
    add_index :reviews, :museum_id
  end
end
