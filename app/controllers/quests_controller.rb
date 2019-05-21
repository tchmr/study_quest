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

  def destroy
    group = Group.find(params[:group_id])
    group.quest.destroy
    redirect_to group_enemies_path(group)
  end

  def win
    @enemy = Enemy.find(params[:enemy_id])
    @group = Group.find(params[:group_id])
    @quest = @group.quest
    if @enemy.get_current_hp(@group) > 0
      redirect_to group_enemy_path(@group, @enemy), notice: 'クエスト継続中です'
      return
    end
    @group.quest.create_records
    @group.quest.destroy
  end

  def lose
    @enemy = Enemy.find(params[:enemy_id])
    @group = Group.find(params[:group_id])
    if @group.quest.remain_days > 0
      redirect_to group_enemy_path(@group, @enemy), notice: 'クエスト継続中です'
      return
    end
    @group.quest.destroy
  end

  private
  def quest_params
    params.permit(:group_id, :enemy_id)
  end
end
