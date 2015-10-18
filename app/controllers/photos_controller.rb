class PhotosController < ApplicationController

  def index
    @photos = Photo.all
  end

  def new
    @photo = Photo.new
  end

  def create
    @photo = Photo.new(photos_params)
    if @photo.save
      # @photo.user_id = current_user.id
      # @photo.save
      redirect_to photos_path
    else
      render 'new'
    end
  end

  def photos_params
    params.require(:photo).permit(:name, :description, :image)
  end
end
