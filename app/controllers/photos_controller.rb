class PhotosController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @photos = Photo.all
  end

  def new
  end

  def create
    Photo.create(photo_params)
    redirect_to photos_url
  end

  def show
  end

  private

  def photo_params
    params.require(:photo).permit(:title, :image)
  end
end
