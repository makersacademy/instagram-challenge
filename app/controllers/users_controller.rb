class UsersController < ApplicationController
  def show
    @user = User.find_by(id: current_user.id)
    @posts = @user.posts
  end
end
