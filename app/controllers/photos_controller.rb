class PhotosController < ApplicationController
  before_action :authenticate_user!, :except => [:index, :show]

  def index
    @photos = Photo.all
  end

  def new
  end

  def create
    build_photo(photo_params, current_user.id)
    redirect_to photos_path
  end

  def destroy
    @photo = Photo.find(params[:id])
    unless current_user.has_created?(@photo)
      flash[:notice] = 'You cannot delete this photo'
    else
      @photo.destroy
      flash[:notice] = 'Photo deleted successfully'
    end
    redirect_to photos_path
  end

  def photo_params
    params.require(:photo).permit(:caption, :image)
  end

  private
end
