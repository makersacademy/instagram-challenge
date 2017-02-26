class UsersController < ApplicationController

  def show
    @user = current_user
    @posts = current_user.posts.reverse
  end

end
