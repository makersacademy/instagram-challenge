class UsersController < ApplicationController
  def index
  end

  def show
    if User.exists?(params[:id])
      @user = User.find(params[:id])
      render 'show'
    else
      render new_user_registration_path
    end
  end
end
