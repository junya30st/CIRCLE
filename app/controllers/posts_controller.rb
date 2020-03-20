class PostsController < ApplicationController

  def index
    @posts = Post.includes(:user).order('id DESC').page(params[:page]).per(12)
    user = User.new(user_params)
    @category = Category.all
  end

  def new
    @post = Post.new
    @categories = Category.all
  end

  def create
    @post = Post.create(post_params)
    redirect_to root_path
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
    @categories = Category.all
  end

  def update
    post = Post.find(params[:id])
    if post.user_id == current_user.id
      post.update(post_params)
      redirect_to root_path
    end
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy if post.user_id == current_user.id
    redirect_to root_path
  end

  def category
    @category = Category.find(params[:id])
    @post = Post.where(category)
  end

  private

  def user_params
    params.permit(:id,:nickname, :email, :password, :password_confirmation, :image, :workplace)
  end

  def post_params
    params.require(:post).permit(:title, :image, :text, category_ids: []).merge(user_id: current_user.id)
  end

end