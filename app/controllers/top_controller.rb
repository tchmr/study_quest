class TopController < ApplicationController
  before_action :authenticate_user!, except: :about

  def top
    @group = current_user.group
    if @group
      @quest = current_user.group.quest
    end
  end

  def about
  end
end
