class FollowersController < ApplicationController

  def accept
    current_user.accept_request(User.find(params[:id]))
    redirect_back(fallback_location: root_path)
  end 

  def requests
    @follower_requests = current_user.requested_friends
  end 
end
