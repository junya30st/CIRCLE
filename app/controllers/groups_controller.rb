class GroupsController < ApplicationController

def index
  @groups = Group.all.order(:id)
end

def new
  @group = Group.new
  @group.users << current_user
end

def create
  @group = Group.new(group_params)
  if @group.save
    redirect_to root_path, notice: 'グループが作成されました'
  else
    render "posts/new"
  end
end

def show
  @group = Group.find(params[:id])
  @messages = @group.messages
end

private

def group_params
  params.permit(:name, user_ids: [])
end

end
