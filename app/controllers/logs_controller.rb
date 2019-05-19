class LogsController < ApplicationController
  def show
  end

  def new
    @user = current_user
    @log = Log.new
  end

  def edit
    @user = current_user
    @log = Log.find(params[:id])
  end

  def create
    log = current_user.logs.new(log_params)
    log.save
    redirect_to_mypage
  end

  def update
    log = Log.find(params[:id])
    log.update(log_params)
    redirect_to_mypage
  end

  def destroy
    log = Log.find(params[:id])
    log.destroy
    redirect_to_mypage
  end

  private
  def log_params
    edit_params = params.require(:log).permit(:achieve_ymd, :achieve_time)
    edit_params[:achieve_ymd] = edit_params[:achieve_ymd].to_date
    return edit_params
  end

  def redirect_to_mypage
    redirect_to user_path(current_user)
  end
end
