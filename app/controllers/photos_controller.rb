class PhotosController < ApplicationController
  def index
  end

  def create
    current_user.photos.create(photo_params)
    current_user.photos.last.add_image_url
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
