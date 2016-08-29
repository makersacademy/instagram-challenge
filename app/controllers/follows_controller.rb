class FollowsController < ApplicationController

  before_action :authenticate_user!

  def create
    @user = User.find_by!(username: params[:username])
    current_user.follow(@user)
    redirect_to feed_path(@user)
  rescue ActiveRecord::RecordNotFound
    redirect_to root_path
  end

  def destroy
    @user = User.find_by!(username: params[:username])
    current_user.unfollow(@user)
    redirect_to feed_path(@user)
  rescue ActiveRecord::RecordNotFound
    redirect_to root_path
  end

end
