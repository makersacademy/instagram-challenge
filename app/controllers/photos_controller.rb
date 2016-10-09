class PhotosController < ApplicationController

  def index
    @photos = Photo.all
  end

  def new
    @photo = Photo.new
  end

  def create
    @photo = Photo.create(photo_params)
    if @photo.save
      redirect_to ('/photos')
    else
      render 'new'
    end
  end

  private

  def photo_params
    params[:photo].permit(:name, :description, :image)
  end
end
