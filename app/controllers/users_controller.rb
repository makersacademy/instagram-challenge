class UsersController < ApplicationController
  before_action :require_none, only: [:new]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_session_path
    else
      redirect_to new_user_registration_path
    end
  end

  private

    def user_params
      params.require(:user).permit(:email, :password);
    end



end
