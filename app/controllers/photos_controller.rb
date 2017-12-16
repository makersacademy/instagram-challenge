class PhotosController < ApplicationController
  def index
  end

  def new
    @photo = Photo.new
  end

  def create
    @photo = Photo.new(photo_params)
    p @photo.save!
    p @photo.photo.url
  end

  private

  def photo_params
    params.require(:photo).permit(:photo, :description)
  end
end
