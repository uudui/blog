class User < ActiveRecord::Base
  has_secure_password

  has_many :posts, :dependent => :destroy
  has_many :likes, :dependent => :destroy
  has_many :unlikes, :dependent => :destroy

  validates_presence_of :email, :username

  before_save :generate_remember_token

  #用email和密码验证身份
  def self.authenticate(email, password)
    find_by_email(email).try(:authenticate, password)
  end

  #用token进行登录
  def self.authenticate_with_token(id, token)
    user = find_by_id(id)
    (user && user.remember_token == token) ? user : nil
  end

  def send_reset_password
    generate_token(:reset_password_token)
    self.reset_password_sent_at = Time.now.utc
    save
    PasswordResetWorker.perform_async(self.id)
  end

  def liked_posts(post_ids)
    self.likes.where(post_id: post_ids)
  end

  def unlike_posts(post_ids)
    self.unlikes.where(post_id: post_ids)
  end



  private
    def generate_remember_token
      generate_token(:remember_token) if self.password.present?
    end

    def generate_token(column)
      begin
        self[column] = SecureRandom.urlsafe_base64
      end while User.exists?(column => self[column])
    end

end
