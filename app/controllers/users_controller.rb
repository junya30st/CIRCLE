class UsersController < ApplicationController

  def index
  end

  def show
    @user = User.find(params[:id])
    @post = Post.where(user_id: @user.id).order('id DESC')
  end

end
