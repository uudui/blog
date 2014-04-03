class PasswordResetsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_email(params[:email])
    if user
      user.send_reset_password
      redirect_to root_url, :notice => "Email sent with password reset instructions."
    else
      flash.now.alert = "Invalid email"
      render "new"
    end
  end

  def edit
    @user = User.find_by_reset_password_token(params[:id])
    if @user && @user.reset_password_sent_at > 2.hours.ago
      render :edit
    else
      flash[:error] = "Password reset not found or expired."
      redirect_to new_password_reset_path
    end
  end

  def update
    @user = User.find_by_reset_password_token(params[:id])
    if @user.reset_password_sent_at < 2.hours.ago
      redirect_to new_password_reset_path, :alert => "Password reset has expired."
    elsif @user.update_attributes(user_params)
      redirect_to root_url, :notice => "Password has been reset!"
    else
      render :edit
    end
  end

  private
    def user_params
      params.require(:user).permit(:password, :password_confirmation)
    end
end
