class SessionsController < ApplicationController
  def index
  end

  def new
  end

  def create
    @user = User.find_by(username: user_params[:username])
    
    if @user && @user.authenticate(user_params[:password])
      session[:user_id] = @user.id
      redirect_to '/'
    else
      @error = true
      render 'sessions/new'
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end
end
