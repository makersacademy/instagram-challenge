class UsersController < ApplicationController

  skip_before_action :authorized, only: [:new, :create]
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to '/'
    else
      render 'new'
    end
  end

  private
   def user_params
    params.require(:user).permit(:email,:password)
  end
end
