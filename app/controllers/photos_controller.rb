class PhotosController < ApplicationController

  before_action :authenticate_user!, :except => [:index]

  def index
    @photos = Photo.all
  end

  def create
    @photo = Photo.new(photo_params)
    if @photo.save
      redirect_to photos_path
    else
      render 'new'
    end
  end

  def new
    @photo = Photo.new
  end

  def photo_params
    params.require(:photo).permit(:image)
  end

  def destroy
    @photo = Photo.find(params[:id])
    @photo.destroy
    flash[:notice] = 'Photo deleted successfully'
    redirect_to '/photos'
  end
end
