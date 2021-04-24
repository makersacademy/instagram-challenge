class SessionsController < ApplicationController

def new
  end

  def create
    @user = User.find_by(username: params[:username])
   if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to root_url, notice: "Logged in!"
   else
     flash.now[:alert] = "username or password is invalid"
     render "new"
   end

  end

  def login
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: "Logged out!"
  end

end
