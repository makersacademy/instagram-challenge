class UserPostsController < ApplicationController
  def index
    @user = User.find(params[:user])
    @posts = @user.posts.reverse
  end
end
