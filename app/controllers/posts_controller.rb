class PostsController < ApplicationController

  # def 
  #   user = User.new(user_params)
  #   user.save
  #   sign_in User.find(user.id) unless user_signed_in?
  # end

  def index
    @posts = Post.all.order('id DESC')
    user = User.new(user_params)

    if user.save
      sign_in User.find(user.id) unless user_signed_in?
    end
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
  end
  

  private

  def user_params
    params.permit(:nickname, :email, :password, :password_confirmation)
  end

  def post_params
    params.require(:post).permit(:title, :image, :text, category_ids: []).merge(user_id: current_user.id)
  end
end