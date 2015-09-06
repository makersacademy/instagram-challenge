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

  def update
    @photo = Photo.find(params[:id])
    @photo.update(update_params)
    redirect_to photo_path(@photo)
  end

  def destroy
    @photo = Photo.find(params[:id])
    @photo.destroy
    flash[:notice] = "Photo deleted"
    redirect_to photos_path
  end

  def photo_params
    params.require(:photo).permit(:title, :description, :image)
  end

  def update_params
    params.require(:photo).permit(:title, :description)
  end

end
