class Unlike < ActiveRecord::Base
  validates_presence_of :user_id, :post_id
  validates_uniqueness_of :post_id, :scope => :user_id

  belongs_to :post, :counter_cache => true
  belongs_to :user
end