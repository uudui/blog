class Settings::PasswordsController < Settings::ApplicationController
  before_action :current_password_required, only: [:update]

  def show
  end

  def update
    if @user.update_attributes params.require(:user).permit(:password, :password_confirmation)
      redirect_to settings_password_url, notice: I18n.t('settings.passwords.successfully_updated')
    else
      render :show
    end
  end

  private
    def current_password_required
      unless params[:current_password] && @user.authenticate(params[:current_password])
        flash.now.notice = I18n.t('settings.passwords.current_password')
        render :show
      end
    end

end
