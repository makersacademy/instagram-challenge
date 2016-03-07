class PhotosController < ApplicationController

  before_action :authenticate_user!

  def index
    @photos = Photo.all
  end

  def new
    @photo = Photo.new
  end

  def create
    @photo = Photo.create(photo_params)
    @photo.user_id = current_user.id
    redirect_to photos_path
  end

  def photo_params
    params.require(:photo).permit(:file, :image)
  end

  def show
    @photo = Photo.find(params[:id])
  end
end
