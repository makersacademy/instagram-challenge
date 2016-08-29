class PhotosController < ApplicationController

  def index
    @photos = Photo.all.order('created_at DESC')
  end

  def new
    @photo = Photo.new
  end

  def create
    @photo = Photo.create(photo_params)
    redirect_to root_path
  end

  def edit
    @photo = Photo.find(params[:id])
  end

  def update
    @photo = Photo.find(params[:id])
    @photo.update(photo_params)
    redirect_to root_path
  end

  def destroy
    @photo = Photo.find(params[:id])
    @photo.destroy
    flash[:notice] = 'Post successfully deleted'
    redirect_to root_path
  end

  private

  def photo_params
    params.require(:photo).permit(:caption, :image)
  end

end
