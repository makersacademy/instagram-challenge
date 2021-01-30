class UsersController < ApplicationController

  def index
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(username: params[:username], email: params[:email], password: params[:password])
    session[:username] = @user.username
    if @user.save
      redirect_to "/users/#{@user.username}"
    else
      render :new
    end
  end

  def username
    @username = session[:username]
  end

end
