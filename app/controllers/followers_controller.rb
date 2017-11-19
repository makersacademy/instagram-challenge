class FollowersController < ApplicationController

  def create 
    p params
    @follower = Follower.create(user_id: current_user.id, followee: params[:user_id])
  end

  def index
    @associations = []
    @followers = Follower.where(user_id: current_user.id)
    @followers.each do |follower|
      @associations << User.find(follower.followee).posts
    end
    @associations.reverse!
  end

end
