class GroupsController < ApplicationController
  before_action :authenticate_user!

  def home
    @categories = current_user.groups
  end

  def new
    @group = Group.new
  end

  def create
    @category = Group.new(categories_params)
    if @category.save
      redirect_to home_categories_path, notice: 'Category was successfully created'
    else
      redirect_to new_category_path, notice: 'Cannot create a new category'
    end
  end

  def show; end

  def destroy; end

  private

  def categories_params
    params.require(:group).permit(:name, :icon).merge(user_id: current_user.id)
  end
end
