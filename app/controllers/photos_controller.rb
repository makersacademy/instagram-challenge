class PhotosController < ApplicationController
  before_action :authenticate_user!, :except => [:index, :show]
  def index
    @photos = Photo.all
  end
  def new
    @photo = Photo.new
  end
  def create
    current_user.photos.create(photos_params)
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
    @photo.update(photos_params)

    redirect_to '/photos'
  end
  def destroy
    @photo = Photo.find(params[:id])
    @photo.destroy
    flash[:notice] = 'Photo deleted successfully'
    redirect_to '/photos'
  end

  def photos_params
    params.require(:photo).permit(:title, :image)
  end
end
