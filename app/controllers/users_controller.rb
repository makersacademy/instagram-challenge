class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @posts = @user.posts.order(created_at: :desc)
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
    params.require(:user).permit(:email, :password, :name, :usernname, :bio, :profile_picture)
  end
end
