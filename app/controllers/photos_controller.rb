class PhotosController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @photos = Photo.all.reverse
  end

  def new
  end

  def create
    Photo.create(photo_params)
    redirect_to photos_url
  end

  def show
  end

  def edit
    @photo = Photo.find(params[:id])
    @photo.liked_by current_user
    redirect_to photos_url
  end

  private

  def photo_params
    params.require(:photo).permit(:title, :image).merge(user_id: current_user.id)
  end
end
