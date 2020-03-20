class RelationshipsController < ApplicationController
  before_action :set_user

  #フォローするメソッド
  def follow
    @relationship = Relationship.create(user_id: current_user.id, follow_id: @user.id)
  end

  #フォローを解除するメソッド
  def unfollow
    @relationship = Relationship.find_by(user_id: current_user.id, follow_id: @user.id)
    @relationship.destroy
  end

  private
  def set_user
    @user = User.find(params[:id])
  end
  
end
