class UsersController < ApplicationController

  def show

  end

  def update
    current_user.update(user_params)
    redirect_to current_user
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
    params.require(:user).permit(:email, :password, :name, :usernname, :bio)
  end
end
