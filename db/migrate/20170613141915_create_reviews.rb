class CreateReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :reviews do |t|
      t.integer :rating, null: false
      t.string :body, null: false

      t.belongs_to :museum, index: true
      t.belongs_to :user, index: true
      t.timestamps
    end
  end
end
