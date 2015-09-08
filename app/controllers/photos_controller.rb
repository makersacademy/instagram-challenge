class PhotosController < ApplicationController
  before_action :authenticate_user!, :except => [:index]

  def index
    @photos = Photo.all
  end

  def new
    @photo = Photo.new
  end

  def create
    @photo = current_user.photos.create(photo_params)
    redirect_to photos_path
  end

  def show
    @photo = Photo.find(params[:id])
    @comment = Comment.new
  end

  def destroy
    @photo = Photo.find(params[:id])
    @photo.destroy_as_user(current_user)
    flash[:notice] = 'Photo deleted successfully'
    redirect_to :back
  end

  def photo_params
    params.require(:photo).permit(:description, :image)
  end
end
