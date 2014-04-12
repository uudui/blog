class Comment < ActiveRecord::Base
  validates_presence_of :user_id, :post_id, :body

  belongs_to :user
  belongs_to :post,  :counter_cache => true
end
