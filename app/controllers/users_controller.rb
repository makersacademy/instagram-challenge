class UsersController < ApplicationController
  def new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      flash[:notice] = 'Signup successful'
      redirect_to posts_path
    else
      flash[:notice] = 'Invalid signup information'
      redirect_to new_user_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
