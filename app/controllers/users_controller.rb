class UsersController < ApplicationController
  def index
    @users = User.includes(:logs)
  end

  def show
    @logs = current_user.logs.order(achieve_ymd: :DESC)
  end

end
