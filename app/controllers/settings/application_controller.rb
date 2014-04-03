class Settings::ApplicationController < ApplicationController
  before_action :require_sign_in, :set_user

  private
    def set_user
      @user = current_user
    end
end