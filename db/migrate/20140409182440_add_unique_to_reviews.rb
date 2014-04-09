class AddUniqueToReviews < ActiveRecord::Migration
  def change
    add_index :reviews, [:user_id, :post_id], unique: true
  end
end
