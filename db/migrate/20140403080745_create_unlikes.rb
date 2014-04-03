class CreateUnlikes < ActiveRecord::Migration
  def change
    create_table :unlikes do |t|
      t.string :post_id
      t.string :user_id
      t.timestamps
    end
  end
end
