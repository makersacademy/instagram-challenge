class RelationshipsController < ApplicationController

  def index
    render 'create'
  end

  def create
    user = User.find(params[:followed_id])
    current_user.follow(user)
    redirect_to 'post_path'
  end

  def destroy
    user = Relationship.find(params[:id]).followed
    current_user.unfollow(user)
    redirect_to 'post_path'
  end

end
