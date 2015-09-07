class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @photos = @user.photos.reverse
  end
end
