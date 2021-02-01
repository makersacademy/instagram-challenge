class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params) # also defined arg in priv method - check if this works
    if @user.save
      session[:user_id] = @user.id
      redirect_to photos_url, notice: "Thank you for signing up!"
    else
      render "new"
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end

end
