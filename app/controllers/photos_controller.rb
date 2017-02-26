class PhotosController < ApplicationController
  def index
    @photos = Photo.all
  end

  def new
    @photo = Photo.new
  end

  def create
    @photo = Photo.create(photo_params)
    redirect_to '/photos'
  end

  private

  def photo_params
    params.require(:photo).permit(:image, :caption)
  end

  def caption_params
    params.require(:photo).permit(:caption)
  end
end
