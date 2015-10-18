class PhotosController < ApplicationController
  def index
    @photos = Photo.all
  end

  def new
    @photo = Photo.new
  end

  def create
    photo = Photo.new(photo_params)
    photo.user = current_user
    photo.save
    redirect_to photos_path
  end

  def show
    @photo = Photo.find(params[:id])
  end

  private

  def photo_params
    params.require(:photo).permit(:title, :image)
  end
end
