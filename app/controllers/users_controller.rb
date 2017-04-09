class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @user_posts = @user.posts
    @likes = Like.all
  end
end
