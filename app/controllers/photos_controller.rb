class PhotosController < ApplicationController
  before_action :require_login

  def index
    @photos = Photo.order(created_at: :desc)
  end

  def new
  end

  def create
    @photo = Photo.create(photo_params)
    p @photo
    @photo.save
    redirect_to @photo
  end

  def show
    @photo = Photo.find(params[:id])
  end

  private

  def photo_params
    params.require(:photo).permit(:name, :photo_file)
  end
end
