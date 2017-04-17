class PhotosController < ApplicationController

  before_action :authenticate_user!, :except => [:index, :show]

  def index
    @photos = Photo.all
  end

  def new
    @photo = Photo.new
  end

  def create
    @photo = Photo.create(photo_params)
      if @photo.save
        @photo.user_id = current_user.id
        @photo.save
        redirect_to photos_path
      else
        render 'new'
      end
  end

  def photo_params
    params.require(:photo).permit(:image, :title, :description)
  end

  def show
    @photo = Photo.find(params[:id])
  end

  def destroy
    @photo = Photo.find(params[:id])
    @photo.destroy
    flash[:notice] = 'Photo deleted successfully'
    redirect_to photos_path
  end

end
