class CategoriesController < ApplicationController

  def index
    @category = Category.includes(:post).order('id DESC')
  end

  def show
    @category = Category.find(params[:id])
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.create(category_params)
    redirect_to root_path
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end

end
