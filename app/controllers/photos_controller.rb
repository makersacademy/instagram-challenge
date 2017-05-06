class PhotosController < ApplicationController

  def index
    @photos = Photo.all
  end

  def new
    @photo = Photo.new
  end

  def create
    Photo.create(photo_params)
    redirect_to '/photos'
  end

  def show
    @photo = Photo.find(params[:id])
  end

  def edit
    @photo = Photo.find(params[:id])
  end

  def update
    @photo = Photo.find(params[:id])
    @photo.update(photo_params)

    redirect_to '/photos'
  end

  private

  def photo_params
    params.require(:photo).permit(:caption, :location)
  end
end
