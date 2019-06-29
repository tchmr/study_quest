class TopController < ApplicationController
  before_action :authenticate_user!, except: [:about, :howto]

  def top
    @group = current_user.group
    if @group
      @quest = current_user.group.quest
    end
  end

  def about
    redirect_to top_path if current_user
  end

  def howto
  end
end
