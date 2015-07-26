class PhotosController < ApplicationController
  def index
    @photos = Photo.all
  end
  def new
    @photo = Photo.new
  end
  def create
    Photo.create(photos_params)
    redirect_to '/photos'
  end
  def show
    @photo = Photo.find(params[:id])
  end

  def photos_params
    params.require(:photo).permit(:title, :image)
  end
end
