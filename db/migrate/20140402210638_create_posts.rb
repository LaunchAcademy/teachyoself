class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title, null: false
      t.string :url, null: false
      t.text :description
      t.string :tags

      t.timestamps
    end
  end
end
