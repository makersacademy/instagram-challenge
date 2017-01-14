class PhotosController < ApplicationController

  def index
    @photo = Photo.all
  end

  def new
    @photo = Photo.new
  end

  def create
    Photo.create(photos_params)
    redirect_to photos_path
  end

  def destroy
    @photo = Photo.find(params[:id])
    @photo.destroy
    flash[:notice] = 'Photo deleted successfully'
    redirect_to '/photos'
  end

  def edit
    @photo = Photo.find(params[:id])
  end

  def update
    @photo = Photo.find(params[:id])
    @photo.update(caption_params)
    redirect_to '/photos'
  end

  private
  def photos_params
    params.require(:photo).permit(:image, :caption)
  end

  def caption_params
    params.require(:photo).permit(:caption)
  end


end
