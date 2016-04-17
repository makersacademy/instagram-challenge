class PhotosController < ApplicationController
  before_action :authenticate_user!, :except => [:index, :show]

  def index
    @photos = Photo.all
  end

  def new
  end

  def create
    Photo.create(photo_params)
    redirect_to '/photos'
  end

  def destroy
    
  end

  def photo_params
    params.require(:photo).permit(:caption, :image)
  end
end
