class PhotosController < ApplicationController

  def new
    @photo = Photo.new
  end

  def create
    @photo = Photo.create(photo_params)
    redirect_to photos_path
  end

  def photo_params
    params.require(:photo).permit(:title, :image)
  end

  def index
    @photos = Photo.all
  end

end
