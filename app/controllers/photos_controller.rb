class PhotosController < ApplicationController

  def index
    @photos = Photo.all
  end

  def new
  end

  def photo_params
    params.require(:photo).permit(:caption)
  end

  def create
    Photo.create(photo_params)
    redirect_to '/photos'
  end

end
