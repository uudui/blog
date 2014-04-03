class Post < ActiveRecord::Base
  validates_presence_of :content, :user_id

  belongs_to :user
  has_many :likes, :dependent => :destroy

  scope :wait_check, -> { where(status: '1')}
  scope :has_checked, -> { where(status: '2')}
  scope :order_by_hot, -> { order('likes_count DESC') }

end
