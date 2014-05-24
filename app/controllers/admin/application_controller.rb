class Admin::ApplicationController < ApplicationController
  layout 'admin'

  before_action :require_sign_in, :require_admin

  private

  def require_admin
    raise AccessDenied unless current_user.admin?
  end
end