class EnemiesController < ApplicationController
  def index
    @group = Group.find(params[:group_id])
    @enemies = Enemy.order(:hp)
  end

  def show
    @group = Group.find(params[:group_id])
    @enemy = Enemy.find(params[:id])
    @full_hp = @enemy.hp * @group.users.size
    # quest開始日以降の@group.users.logs.achieve_timeの合計
    #   group_achieve_time = 0
    #   @group.users.each do |user|
    #     user.logs.each do |log|
    #       group_achieve_time += log.achieve_time
    #     end
    #   end
    #   @current_hp = @full_hp - quest開始日以降の@group.users.achieve_timeの合計
  end
end
