class LogsController < ApplicationController
  def show
    @log = Log.new
    # binding.pry
  end

  def create
    log = Log.new(log_params)
    log.save
    redirect_to action: :show
  end

  def update
  end

  def destroy
  end

  def log_params
    edit_params = params.require(:log).permit(:achieve_ymd, :achieve_time)
    edit_params[:achieve_ymd] = edit_params[:achieve_ymd].to_date
    return edit_params
  end
end
