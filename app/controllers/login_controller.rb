class LoginController < ApplicationController

  def new
    @user = User.new
  end
  
  def create
    @user = User.find_by(username: params[:username])
    if @user && @user.authenticate(params[:password])
      session[:current_user_id] = @user.id
      redirect_to @user
    else  
      redirect_to root_path, notice: "Logged in"
    end
  end

  def destroy
    session.delete(:current_user_id)
    @_current_user = nil
    redirect_to root_path
  end
end
