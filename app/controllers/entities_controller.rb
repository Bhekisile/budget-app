class EntitiesController < ApplicationController
  before_action :authenticate_user!

  def index
    @group = Group.find(params[:group_id])
    @entities = @group.entities
    @entities = @entities.sort { |a, b| b.created_at <=> a.created_at }
    @total = @entities.map(&:amount).sum
  end

  def new
    @entity = Entity.new
    @group = Group.find(params[:group_id])
  end

  def create
    @purchase = Entity.new(purchases_params)
    @group = Group.find(params[:group_id])

    if @purchase.save
      EntityGroup.create(group_id: @group.id, entity_id: @purchase.id)
      redirect_to group_entities_path(group_id: @group.id), notice: 'Entity successfully created.'
    else
      redirect_to new_group_entity_path(group_id: @group.id), notice: 'Could not create entity.'
    end
  end

  def destroy
    @entity = Entity.find(params[:id])
    @entity.destroy
    flash[:success] = 'Entity item has been removed.'
    redirect_to group_entities_path
  end

  private

  def purchases_params
    params.require(:entity).permit(:name, :amount).merge(author_id: current_user.id)
  end
end
