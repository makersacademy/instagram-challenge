class PhotosController < ApplicationController
  def index
    @photos = Photo.all
  end

  def new
    @photo = Photo.new
  end

  def create
    Photo.create(photo_params)
    redirect_to '/'
  end

  def show
    @photo = Photo.find(params[:id])
  end


  private

  def photo_params
    params.require(:photo).permit(:description, :image)
  end
end
