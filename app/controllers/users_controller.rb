class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:show, :follow, :unfollow]
  before_action :authenticate_user!, only: [:show]

  def show 
    @user = User.find(params[:id])
    @images = @user.images.order('created_at DESC')
  end 

  def follow
    @current_user = current_user
    @user = User.find(params[:id])
    @current_user.follow(@user)
    @follow = Follow.find_by(follower: @current_user, followable: @user)
    respond_to :js
    # redirect_to(images_path)
  end 

  def unfollow
    @current_user.stop_following(@user)
    respond_to :js
  end 
end
