class UsersController < ApplicationController

  def show
    @user = User.find_by(username: params[:username])
    redirect_to root_path unless @user
  end


end
