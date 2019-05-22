class UsersController < ApplicationController
  def index
    @users = User.includes(:logs)
  end

  def show
    @user = User.find(params[:id])
    @logs = @user.logs.order(achieve_ymd: :DESC)
  end

end
