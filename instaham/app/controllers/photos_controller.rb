class PhotosController < ApplicationController

  def index
    @photos = Photo.all
  end

  def new
    @photo = Photo.new
  end

  def create
    photo = Photo.create(params.require(:photo).permit(:message))
    redirect_to '/photos'
  end

end
