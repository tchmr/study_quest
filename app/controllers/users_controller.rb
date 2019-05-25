class UsersController < ApplicationController
  def index
    @users = User.includes(:logs).order(level: :desc)
  end

  def show
    @user = User.find(params[:id])
    @logs = @user.logs.order(achieve_ymd: :DESC)
    gon.logs_ymd = @user.logs.order(:achieve_ymd).map { |log| log.achieve_ymd }
    gon.logs_time = @user.logs.order(:achieve_ymd).map { |log| log.achieve_time }
  end

end
