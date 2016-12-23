class ProfilesController < ApplicationController

  before_action :set_user
  before_action :authenticate_user!
  before_action :owned_profile, only: [:edit, :update]

  def show
    @users = User.all
    @user = User.find_by(user_name: params[:user_name])
  end

  private

  def set_user
    @user = User.find_by(user_name: params[:user_name])
  end

end
