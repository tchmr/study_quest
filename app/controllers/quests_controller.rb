class QuestsController < ApplicationController
  def create
    group = Group.find(params[:group_id])
    enemy = Enemy.find(params[:enemy_id])
    quest = Quest.new(quest_params)
    if quest.save
      redirect_to group_enemy_path(group, enemy)
    else
      redirect_to group_enemies_path
    end
  end

  private
  def quest_params
    params.permit(:group_id, :enemy_id)
  end
end
