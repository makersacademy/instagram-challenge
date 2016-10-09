class PhotosController < ApplicationController

  def new
    @photo = Photo.new
  end

  def create
    @photo = Photo.create(photo_params)
  end

  private

  def photo_params
    params[:photo].permit(:name, :description, :image)
  end
end
