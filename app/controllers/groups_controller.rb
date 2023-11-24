class GroupsController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index; end

  def home
    @groups = current_user.groups
  end

  def new
    @group = Group.new
  end

  def create
    @group = current_user.groups.build(group_params)
    if @group.save
      flash[:notice] = 'Group was successfully created.'
      redirect_to home_groups_path(@group)
    else
      flash[:alert] = 'Cannot create a new group.'
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @group = Group.find(params[:id])
    @group.destroy
    flash[:success] = 'Group item has been removed.'
    redirect_to home_groups_path
  end

  private

  def group_params
    params.require(:group).permit(:name, :icon).merge(user_id: current_user.id)
  end
end
