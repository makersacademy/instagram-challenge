class UsersController < ApplicationController


  def show
    @posts=current_user.posts.all
    render 'show'
  end

  def following
    @following = current_user.following
  end

  def followers
    @followers = current_user.followers
    @users = User.all - (current_user.following)
  end


end
