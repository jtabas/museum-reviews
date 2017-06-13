class CreateReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :reviews do |t|
      t.belongs_to :museums
      t.belongs_to :users
      t.integer :rating, null: false
      t.string :body, null: false
      t.timestamps
    end
  end
end
