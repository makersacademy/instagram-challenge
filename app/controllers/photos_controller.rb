class PhotosController < ApplicationController
  def index
  end

  def new
    @photo = Photo.new
  end

  def create
    @photo = Photo.create(photo_params)
  end

  private

  def photo_params
    params.require(:photo).permit(:image)
  end

end
