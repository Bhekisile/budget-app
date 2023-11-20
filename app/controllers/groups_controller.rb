class GroupsController < ApplicationController
  before_action :authenticate_user!

  def index
    # @groups = current_user.group.includes(:entities)
  end

  def new
    @group = Group.new
  end

  def create
    @group = current_user.group.build(group_params)

    if @group.save
      redirect_to groups_path, notice: 'Category was successfully created.'
    else
      render :new
    end
  end

  def show; end

  def destroy; end

  private

  def group_params
    params.require(:group).permit(:name, :icon)
  end
end
