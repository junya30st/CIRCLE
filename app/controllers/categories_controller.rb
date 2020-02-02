class CategoriesController < ApplicationController

  def index
    @category = Category.includes(:post).order('id DESC')
  end

  def show
    @category = Category.find(params[:id])
  end

  def create
    @category = Category.create(category_params)
  end

  private

  def category_params
    params.permit(:name)
  end

end
