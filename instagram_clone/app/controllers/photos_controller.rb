class PhotosController < ApplicationController

  def index
    @photos = Photo.all
  end

  def new
    Photo.new
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
    redirect_to "/photos"
  end

  def destroy
    @photo = Photo.find(params[:id])
    @photo.destroy
    redirect_to '/photos'
  end

  private

  def photo_params
    params.require(:photo).permit(:location, :image, :description)
  end

end
