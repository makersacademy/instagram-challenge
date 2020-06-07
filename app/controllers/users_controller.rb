class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to '/sessions/new', notice: 'Account created successfully'
    else
      redirect_to '/users/new', notice: 'Email and/or password is not meeting the requirements'
    end
  end

  private

  def user_params
    params.require(:user).permit(:full_name, :username, :email, :password)
  end
end
