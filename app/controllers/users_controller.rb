class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @photos = Photo.where(user_id: params[:id])
  end

end
