class PhotosController < ApplicationController
  def index
  end

  def new
    @photo = Photo.new
  end

  def create
    @photo = Photo.new(photo_params)
    @photo.save!
    render 'index'
  end

  def show
    @comment = Comment.new
  end

  private

  def photo_params
    params.require(:photo).permit(:photo, :description)
  end
end
