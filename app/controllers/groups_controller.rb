class GroupsController < ApplicationController
  def index
    @groups = Group.all.order(created_at: 'DESC')
  end

  def show
    @group = Group.find(params[:id])
    @wishes = @group.wishlists.order(created_at: :desc)
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    @group.user_id = current_user.id
    if @group.save
      redirect_to groups_path
    else
      render :new
    end
  end

  def destroy
    @group = Group.find(params[:id])
    @group.destroy
    redirect_to group_path
  end

  private

  def group_params
    params.require(:group).permit(:name, :icon)
  end
end
