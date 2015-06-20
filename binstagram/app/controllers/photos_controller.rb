class PhotosController < ApplicationController
  
  def photo_params
    params.require(:photo).permit(:image, :name, :description)
  end

  def index
    @photos = Photo.all
  end

  def new
    @photo = Photo.new
  end

  def create
    @photo = Photo.new(photo_params)
    redirect to photos_path
  end

end
