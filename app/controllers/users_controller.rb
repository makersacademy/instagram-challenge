class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    redirect_to welcome_home_url
  end

  private

  def user_params
    params.require(:users).permit(:first_name,
                                 :last_name,
                                 :email,
                                 :password
                                )
  end
end
