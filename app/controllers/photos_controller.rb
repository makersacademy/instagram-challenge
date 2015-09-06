class PhotosController < ApplicationController

  def index
    @photos = current_user.photos.reverse
  end

  def new
    @photo = Photo.new
  end

  def create
    Photo.create(photo_params.merge(user: current_user))
    redirect_to photos_path
  end

  def photo_params
    params.require(:photo).permit(:title, :description, :image)
  end

end
