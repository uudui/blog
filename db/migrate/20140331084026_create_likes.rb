class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|
      t.string :post_id, :index => true
      t.string :user_id, :index => true
      t.timestamps
    end
  end
end
