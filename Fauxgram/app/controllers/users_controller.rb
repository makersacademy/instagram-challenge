class UsersController < ApplicationController
  def show 
  end
  def create
    @user = User.new(user_params)
  end

  def update
    current_user.update(params[:user])
    redirect_to current_user
  end

  def user_params
    params.require(:user).permit(:username, :name, :website, :bio, :email, :phone, :gender)
  end
end
