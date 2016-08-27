class UsersController < ApplicationController

  def show
    @user = User.find_by!(username: params[:username])
  rescue ActiveRecord::RecordNotFound
    redirect_to root_path
  end

  def index
    @users = User.all
  end

end
