class FollowersController < ApplicationController

  def accept
    current_user.accept_request(User.find(params[:id]))
    redirect_to user_path(params[:id])
  end 
end
