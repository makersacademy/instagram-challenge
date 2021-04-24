class Api::V1::UsersController < ApplicationController
  def index
    @users = User.all
    json_response(@users)
  end

  def create
    @user = User.create!(user_params)
    json_response(@user, :created)
  end

  def show
  end

  def destroy
  end

  def user_params
    params.permit(:username, :password, :forename, :lastname)
  end
end
