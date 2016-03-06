class PhotosController < ApplicationController
 before_action :authenticate_user!, :except => [:index] 
  def index
    @photos = Photo.all
    @user = current_user
  end

  def new
    @photo = Photo.new
  end

  def create
    Photo.create(photo_params)
    redirect_to '/'
  end

def photo_params
  params.require(:photo).permit(:description, :image)
end
end
