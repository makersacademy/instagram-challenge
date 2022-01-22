class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      flash[:success] = "Account created!"
      redirect_to posts_path
    else
      flash.now[:failure] = "Unable to create account. All fields are required. Already have an account? Log in" 
      render :new
    end

  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :username, :password, :password_confirmation)
  end

end
