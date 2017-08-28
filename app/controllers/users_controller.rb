class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @posts = @user.posts.reverse
    render 'users/show'
  end

end
