class PhotosController < ApplicationController

  def index
    @photo = Photo.all
  end

  def new
    @photo = Photo.new
  end

  def create
    Photo.create(photos_params)
    redirect_to photos_path
  end

  private
  def photos_params
    params.require(:photo).permit(:image, :caption)
  end


end
