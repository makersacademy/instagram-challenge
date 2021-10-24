class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to post_path
    else
      redirect_to action: "new"  
    end
  end

  def show
    @user = User.find(params[:id])
  end

  private

  def user_params
    parmas.require(:user).permit(:username, :email, :password)
  end
  
end
