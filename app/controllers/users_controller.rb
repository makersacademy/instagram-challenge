class UsersController < ApplicationController
  def index
  end

  def show
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to root_path, notice: "Account created"
    else
      render :new
    end
  end

  private

    def user_params
      params.require(:user).permit(:firstname, :surname, :email, :username, :password)
    end
end
