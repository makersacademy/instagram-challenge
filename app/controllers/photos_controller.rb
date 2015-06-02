class PhotosController < ApplicationController
  def index
    @photos = Photo.all
  end

  def new
  end

  def create
    Photo.create(photo_params)
    redirect_to '/photos'
  end

  def photo_params
    info = params.require(:photo).permit(:description, :image)
    info.merge(user: current_user)
  end
end
