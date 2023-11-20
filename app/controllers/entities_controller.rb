class EntitiesController < ApplicationController
  # before_action :authenticate_user!
  # before_action :set_group

  def index
    @entities = @group.entities
    @total_amount = @entities.sum(:amount)
  end

  def new
    @group = Group.find(params[:group_id])
    @groups = current_user.groups
    @entity = Entity.new
  end

  def create; end

  def destroy; end

  def set_group
    @group = current_user.groups.find(params[:group_id])
  end

  def entity_params
    params.require(:entity).permit(:name, :amount, :group_id)
  end
end
