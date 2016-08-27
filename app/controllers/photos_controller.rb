class PhotosController < ApplicationController
  before_action :authenticate_user!, :except => [:index, :show]
  
  def index
    @photos = Photo.all
  end

  def new
  end

  def create
    Photo.create_photo_with_user(photo_params, current_user.id)
    redirect_to photos_path
  end

  def destroy
    flash[:notice] = Photo.find_and_delete_photo(params[:id], current_user)
    redirect_to photos_path
  end

  def photo_params
    params.require(:photo).permit(:caption, :image)
  end

    
end

