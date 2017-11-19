class FollowersController < ApplicationController

  def create 
    p params
    @follower = Follower.create(user_id: current_user.id, followee: params[:user_id])
  end

end
