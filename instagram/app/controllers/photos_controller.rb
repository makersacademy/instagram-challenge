class PhotosController < ApplicationController

  def index
    @photos = Photo.all
  end

  def new
    @photo = Photo.new
  end

  def create
    Photo.create(photo_params)
    redirect_to '/photos'
  end

  def photo_params
  params.require(:photo).permit(:comment)
end
end
