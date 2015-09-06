class PhotosController < ApplicationController

  def index
    @photos = current_user.photos.reverse
  end

  def new
    @photo = Photo.new
  end

  def create
    Photo.create(photo_params.merge(user: current_user))
    redirect_to photos_path
  end

  def show
    @photo = Photo.find(params[:id])
  end

  def edit
    @photo = Photo.find(params[:id])
  end

  def photo_params
    params.require(:photo).permit(:title, :description, :image)
  end

end
