class UsersController < ApplicationController

def show
  @user = User.find(params[:id])
  @post = Post.where(user_id: @user.id).order('id DESC')
  @posts = Post.find(params[:id])
end

end
