class PhotosController < ApplicationController

  before_action :authenticate_user!, :except => [:index, :show]

  def index
    @photos = Photo.all
  end

  def new
    @photo = Photo.new
  end

  def create
    @photo = Photo.create(photo_params)
    if @photo.save
      redirect_to photos_path
    else
      flash[:notice] = 'You must upload a photo to post'
      redirect_to photos_path
    end
  end

  def photo_params
    params.require(:photo).permit(:title, :image)
  end

  def show
    @photo = Photo.find(params[:id])
  end

  def destroy
    @photo = Photo.find(params[:id])
    @photo.destroy
    flash[:notice] = 'Photo deleted successfully'
    redirect_to photos_path
  end


end
