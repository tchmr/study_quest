class GroupsController < ApplicationController

  def index
    @current_group = current_user.group
    @groups = if @current_group
                Group.where.not(id: @current_group.id)
              else
                Group.all
              end
  end

  def show
    @group = Group.find(params[:id])
  end

  def new
    @group = Group.new
    members_user_ids = Member.all.map { |member| member.user_id } << current_user.id
    @users = User.where.not(id: members_user_ids).order(:name)
  end

  def create
    @group = Group.new(group_params)
    if @group.save
      redirect_to groups_path, notice: 'グループを結成しました'
    else
      @users = User.where.not(id: current_user.id).order(:name)
      render :new
    end
  end

  def destroy
    if current_user.group.leader == current_user.id
      current_user.group.destroy
      redirect_to groups_path, notice: 'グループを削除しました'
    else
      redirect_to groups_path, notice: 'グループの削除はリーダーのみ可能です'
    end
  end

  private
  def group_params
    edit_params = params.require(:group).permit(:name, user_ids: []).merge(leader: current_user.id)
    edit_params[:user_ids] = edit_params[:user_ids].reject { |id| id == "" }
    edit_params[:user_ids] << current_user.id
    return edit_params
  end
end
