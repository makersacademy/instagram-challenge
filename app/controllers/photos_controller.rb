class PhotosController < ApplicationController

  def index
    @photos = Photo.all
  end

  def new
    @photo = Photo.new
  end

  def create
    @photo = Photo.create(photo_params)
    redirect_to root_path
  end

  private

  def photo_params
    params.require(:photo).permit(:description)
  end

end
