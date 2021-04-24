class UsersController < ApplicationController

  def new
    @user = User.new

  end

  def create
    @user = User.create(params.require(:user).permit(:username,
   :password))

   if @user.save
      session[:user_id] = @user.id
      redirect_to root_url
    else
      render :new
    end
  end
end
