class SessionsController < ApplicationController

  skip_before_action :authorized, only: [:new, :create, :welcome]

  def new
  end

  def create
    @user = User.find_by(username: params[:username])

    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to root_path
    else
      redirect_to login_path
    end
  end

  def login
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end

  def welcome
  end

  def page_requires_login
  end
end
