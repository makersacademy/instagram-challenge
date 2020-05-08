class UsersController < ApplicationController
  def new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path
    else
      @errors = @user.errors
      render 'new'
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :username, :password)
  end
end
