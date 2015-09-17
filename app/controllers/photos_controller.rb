
class PhotosController < ApplicationController

  before_action :authenticate_user!, :except => [:index, :show]

  def index
    @photos = Photo.all
    # @comment = Comment.new
  end

  def new
    @photo = Photo.new
  end

  def create
    @photo = current_user.photos.new(photo_params)
    # @photo.user_id = current_user.id
    if @photo.save
      redirect_to photos_path
    else
      render 'new'
    end
  end

  def photo_params
    params.require(:photo).permit(:picture)
  end
end
