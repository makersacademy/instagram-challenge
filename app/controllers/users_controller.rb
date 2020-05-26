class UsersController < ApplicationController
  def welcome
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(params.require(:user).permit(:username, :password))
    session[:user_id] = @user.id
    redirect_to '/posts'
  end

  def current_user    
    User.find_by(id: session[:user_id])  
  end
end
