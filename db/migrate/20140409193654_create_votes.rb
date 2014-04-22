class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.integer :vote, null: false, default: 0
      t.integer :user_id
      t.integer :review_id

      t.timestamps
    end
  end
end
