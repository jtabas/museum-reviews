class AddColumnToReviews < ActiveRecord::Migration[5.1]
  def change
    add_column :reviews, :user_id, :integer, null: false, default: 0
  end
end
