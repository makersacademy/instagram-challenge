class PhotosController < ApplicationController
  def index
    @user = current_user
    @photos = Photo.all
  end

  def new
    @photo = Photo.new

  end

  def create
    @photo = Photo.create(photo_params)
    redirect_to photos_url
  end

  private

  def photo_params
    user_id = current_user[:user_id]
    params.require(:photo).permit(:title, :image, :user_id)
  end
end
