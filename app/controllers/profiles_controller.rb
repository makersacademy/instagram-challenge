class ProfilesController < ApplicationController

  def index
  end

  def show
    @user = User.find_by_username(params[:id])
  end

end
