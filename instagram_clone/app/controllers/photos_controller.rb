class PhotosController < ApplicationController

  def index
    @photos = Photo.all
  end

  def new

  end

  def show
    @photo = Photo.find(params[:id])
  end

  def edit
    @photo = Photo.find(params[:id])
  end

  def update
    @photo = Photo.find(params[:id])
    @photo.update(photo_params)
    redirect_to '/photos'
  end

  def create
    Photo.create(photo_params)
    flash[:notice] = 'Picture uploaded successfully'
    redirect_to '/photos'
  end

  def destroy
    @photo = Photo.find(params[:id])
    @photo.destroy
    flash[:notice] = "Photo deleted successfully"
    redirect_to '/photos'
  end

  def photo_params
    params.require(:photo).permit(:caption,:image)
  end
end
