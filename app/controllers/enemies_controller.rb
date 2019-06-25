class EnemiesController < ApplicationController
  before_action :authenticate_user!

  def index
    @group = Group.find(params[:group_id])
    @enemies = Enemy.order(:hp)
  end

  def show
    @group = Group.find(params[:group_id])
    @enemy = Enemy.find(params[:id])
    # 残日数、HPともに0のとき、winかloseかを正しく判定できない。
    if @group.quest.remain_days == 0
      redirect_to "/groups/#{@group.id}/enemies/#{@enemy.id}/quests/lose"
      return
    elsif @enemy.get_current_hp(@group) == 0
      redirect_to "/groups/#{@group.id}/enemies/#{@enemy.id}/quests/win"
      return
    end
  end
end
