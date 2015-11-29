class PhotosController < ApplicationController

  def index
    @photos = Photo.all
  end

  def new

  end

  def create
    Photo.create(photo_params)
    flash[:notice] = 'Picture uploaded successfully'
    redirect_to '/photos'
  end

  def photo_params
    params.require(:photo).permit(:caption,:image)
  end
end
