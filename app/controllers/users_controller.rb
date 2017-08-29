class UsersController < ApplicationController

  before_action :authenticate_user!

  def show
    if User.exists?(params[:id])
      @user = User.find(params[:id])
      render :show
    else
      redirect_to pictures_url
    end
  end

end
