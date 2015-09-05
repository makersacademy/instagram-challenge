class PhotosController < ApplicationController

  def index
    @photo = Photo.all
  end

  def new
    @photo = Photo.new
  end

  def create
    @photo = Photo.create(photo_params)
    redirect_to '/photos'
  end

  def photo_params
    params.require(:photo).permit(:title)
  end

  def show
    @photo = Photo.find(params[:id])
  end
end
