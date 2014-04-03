class Settings::ProfilesController < Settings::ApplicationController
  def show
  end

  def update
    if @user.update_attributes params.require(:user).permit(:username, :bio, :email)
      redirect_to settings_profile_url, notice: I18n.t('settings.profiles.successfully_updated')
    else
      render :show
    end
  end
end
