class RegistrationsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path, notice: 'Successfully created account'
    else
      redirect_to sign_up_path, notice: "Something went wrong. Please try again"
    end
  end

    private

  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end
end
