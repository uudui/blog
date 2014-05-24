class Admin::UsersController < Admin::ApplicationController
  layout 'admin'

  def index
    @users = User.order(id: :desc).page(params[:page]).per(10)
  end

  def show

  end
end