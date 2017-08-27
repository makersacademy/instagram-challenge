class FollowersController < ApplicationController
  before_action :authenticate_user!

  def create
    @user = User.find(following_params[:user_id])
    @user.followers << current_user
    redirect_to profile_path(@user.username)
  end

  def destroy
    @user = User.find(following_params[:user_id])
    @user.followers.delete(current_user)
    redirect_to profile_path(@user.username)
  end

  private
  def following_params
    params.require(:follow).permit(:user_id)
  end
end
