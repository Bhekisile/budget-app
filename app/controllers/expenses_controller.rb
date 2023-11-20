class ExpensesController < ApplicationController
  before_action :authenticate_user!
  # before_action :set_group

  def @category = Group.find(params[:category_id])
    @expenses = @category.entities
    @expenses = @expenses.sort { |a, b| b.created_at <=> a.created_at }
    @total = @expenses.map(&:amount).sum
  end

  def new
    @entity = Entity.new
    @category = Group.find(params[:category_id])
  end

  def create
    @purchase = Entity.new(purchases_params)
    @category = Group.find(params[:category_id])

    if @purchase.save
      EntityGroup.create(group_id: @category.id, entity_id: @purchase.id)
      redirect_to category_expenses_path(group_id: @category.id), notice: 'Expenses successfully created.'
    else
      redirect_to new_category_expense_path(group_id: @category.id), notice: 'Could not create expenses.'
    end
  end

 private

  def purchases_params
    params.require(:entity).permit(:name, :amount).merge(author_id: current_user.id)
  end
end
