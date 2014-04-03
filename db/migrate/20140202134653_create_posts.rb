class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.integer :user_id
      t.text :content
      t.text :tip
      t.integer :likes_count, :default => 0
      t.integer :unlikes_count, :default => 0
      t.integer :comments_count, :default => 0

      t.timestamps
    end
  end
end
