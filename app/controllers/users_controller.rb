class UsersController < ApplicationController

  def show

  end

  def edit
    @user = User.find_by(params[:id])
  end

  def create
    @user = User.create(user_params)
    redirect_to current_user_path
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :name, :usernname,)
  end
end
