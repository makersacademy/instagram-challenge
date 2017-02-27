class PhotosController < ApplicationController

  before_action :authenticate_user!, :except => [:index, :show]

  def index
    @photos = Photo.all.reverse
  end

  def new
   @photo = Photo.new
  end

  def create
    photo = Photo.create(photo_params)
    redirect_to photos_path
  end

  def show
    @photo = Photo.find(params[:id])
  end

  def edit
    @photo = Photo.find(params[:id])
  end

  def update
    photo = Photo.find(params[:id])
    # photo.update(photo_params) if photo.belong_to?(current_user)
    photo.update(photo_params) if photo.created_by?(current_user)
    redirect_to photos_path
  end

  def destroy
    photo = Photo.find(params[:id])
    photo.destroy if photo.created_by?(current_user)
    # flash[:notice] = "Successfully deleted the photo!"
    redirect_to photos_path
  end

  private

  def photo_params
    form_params = params.require(:photo).permit(:image, :caption).merge(user: current_user)
    # params.require(:photo).permit(:image, :caption)
  end
end
