class PhotosController < ApplicationController

  before_action :authenticate_user!, :except => [:index, :show]

  def index
    @photos = Photo.all
    @comment = Comment.new
  end

  def new
    @photo = Photo.new
  end

  def create
    p "about to create photo"
    @photo = current_user.photos.new(photo_params)
    if @photo.save
      redirect_to photos_path
    else
      p "about to flash error"
      render :new
      flash[:notice] = 'You need to provide a photo file'
    end
  end

  def photo_params
    params.require(:photo).permit(:picture)
  end
end
