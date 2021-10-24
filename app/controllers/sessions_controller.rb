class SessionsController < ApplicationController

  # login
  def create
    session[:user_id] = nil
    @user = User.find_by(email: params[:email])

    if !! @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to posts_path
    else
      message = "Something went wrong! Make sure your email and password are correct"
      redirect_to login_path, notice: message
    end
  end

end