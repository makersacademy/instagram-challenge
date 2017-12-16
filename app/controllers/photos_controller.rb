class PhotosController < ApplicationController
  def index
  end

  def new
    @photo = Photo.new
  end

  def create
    @photo = Photo.new(photo_params)
    @photo.save!
  end

  private

  def photo_params
    params.require(:photo).permit(:photo, :description)
  end
end
