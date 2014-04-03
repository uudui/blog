class AddStatusToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :status, :string, :default => "1", :limit => 1, :after => :bio
  end
end
