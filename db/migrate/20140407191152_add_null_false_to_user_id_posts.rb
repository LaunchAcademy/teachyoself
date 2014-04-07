class AddNullFalseToUserIdPosts < ActiveRecord::Migration
  def up
    change_column :posts, :user_id, :integer, null: false
  end

  def down
    change_column :posts, :user_id, :integer
  end


end
