class PhotosController < ApplicationController

  def index
    @photos = Photo.all
  end

  def new
    @photo = Photo.new
  end

  def create
    @photo = Photo.new(photo_params)
    if @photo.save
      redirect_to '/photos'
    else
      render 'new'
    end
  end

  def photo_params
    params.require(:photo).permit(:caption, :image)
  end

end
