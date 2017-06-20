class ChangeReviewsToFloat < ActiveRecord::Migration[5.1]
  def change
    change_column :museums, :rating, :float
  end
  

end
