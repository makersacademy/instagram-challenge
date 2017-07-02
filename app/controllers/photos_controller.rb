class PhotosController < ApplicationController
  before_action :require_login

  def index
    @photos = Photo.order(created_at: :desc)
  end

  def new
  end

  def create
    @photo = current_user.photos.create(photo_params)
    @photo.save
    redirect_to photos_path
  end

  def show
    @photo = Photo.find(params[:id])
    @comments = @photo.comments
  end

  private

  def photo_params
    params.require(:photo).permit(:name, :image, :remove_image, :image_cache, :remote_image_url)
  end
end
