class PhotosController < ApplicationController
  def index
  end

  def new
  end

  def create
    Photo.create(photo_params)
    redirect_to '/photos'
  end

  def photo_params
    params.require(:photo).permit(:image, :caption)
  end

  def show
    @photo = Photo.first(params[:id])[0]
  end
end
