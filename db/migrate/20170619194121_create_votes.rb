class CreateVotes < ActiveRecord::Migration[5.1]
  def change
    create_table :votes do |t|
      t.boolean :upvote, null: false
      t.integer :review_id, null: false
      t.integer :user_id, null: false
      t.timestamps
    end
      add_index :votes, [:review_id, :user_id], unique: true
  end
end
