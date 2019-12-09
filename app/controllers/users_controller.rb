class UsersController < ApplicationController
  def new
  end

  def create
    @user = User.new(user_params)
    @user.email.downcase!

    if @user.save
      flash[:notice] = 'Signup successful'
      session[:user_id] = @user.id.to_s
      redirect_to root_path
    else
      flash.now.alert = 'Invalid signup information'
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
