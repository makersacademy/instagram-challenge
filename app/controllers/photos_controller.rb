class PhotosController < ApplicationController
  def index
  end

  def create
    new_photo = Photo.create(photo_params)
    new_photo.add_image_url
    render :index
  end

  def new
    @photo = Photo.new
  end

private

  def photo_params
    params.require(:photo).permit(:photo, :title, :description)
  end

end
