class PhotosController < ApplicationController

  before_action :authenticate_user!, :except => [:index, :show]

  def new
    @photo = Photo.new
  end

  def create
    @photo = current_user.photos.new(photo_params)
    @photo.save
    redirect_to photos_path
  end

  def photo_params
    params.require(:photo).permit(:title, :image)
  end

  def index
    @photos = Photo.all
  end

end
