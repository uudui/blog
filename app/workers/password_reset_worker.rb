class PasswordResetWorker
  include Sidekiq::Worker

  def perform(user_id)
    user = User.find_by_id(user_id)
    UserMailer.password_reset(user).deliver
  end
end