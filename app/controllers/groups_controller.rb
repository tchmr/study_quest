class GroupsController < ApplicationController

  def index
    # @groups = Group.where(id: Member.all)
    @groups = Group.all
    # binding.pry
  end

  def show
    @group = Group.find(params[:id])
  end

  def new
    @group = Group.new
    @users = User.where.not(id: current_user).order(:name)

    # いずれのグループにも所属していないメンバーのみ抽出したい
    # query = Member.all
    # @users = User.where.not(id: [current_user, query]).order(:name)
    # binding.pry

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
