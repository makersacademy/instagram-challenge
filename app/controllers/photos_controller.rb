class PhotosController < ApplicationController
  def index
  end

  def create
    Photo.create(photo_params)
    render :index
  end

  def new
    @photo = Photo.new
  end

private

  def photo_params
    params.require(:photo).permit(:photo)
  end

end
