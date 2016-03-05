class PhotosController < ApplicationController
  before_action :authenticate_user!, :except => [:index]
  def index
    @photos = Photo.all
  end

  def new
    @photo = Photo.new
  end

  def create
    @photo = Photo.create(photo_params)
    redirect_to photos_path
  end

  def destroy
    @photo = Photo.find(params[:id])
    @photo.destroy
    flash[:notice] = 'Photo deleted successfully'
    redirect_to photos_path
  end


  def photo_params
    params.require(:photo).permit(:description, :image)
  end
end
