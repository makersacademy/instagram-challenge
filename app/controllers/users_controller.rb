class UsersController < ApplicationController

  def index
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    session[:username] = @user.username
    if @user.save
      redirect_to "/users/#{@user.username}"
    else
      render :new
    end
  end

  def username
    @username = session[:username]
    @posts = Post.all.reverse
  end

  private
  def user_params
    params.require(:user).permit(:username, :email, :password)
  end

end
