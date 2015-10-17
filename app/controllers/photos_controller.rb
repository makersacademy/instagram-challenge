class PhotosController < ApplicationController
  def new
    @photo = Photo.new
  end

  def create
    @photo = Photo.create(photo_params)
    redirect_to @photo
  end

  def show
    @photo = Photo.find(params[:id])
  end


  def photo_params
    params.require(:photo).permit(:title, :image)
  end
end
