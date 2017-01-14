class PhotosController < ApplicationController
  def index
    @photos = Photo.all
  end

  def new
  end

  def create
    Photo.create(photos_params)
    redirect_to '/photos'
  end

  private

  def photos_params
    params.require(:photo).permit(:description)
  end

end
