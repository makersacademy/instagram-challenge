class PhotosController < ApplicationController

  before_action :authenticate_user!, :except => [:index, :show]

  def new
    @photo = Photo.new
  end

  def create
    @photo = current_user.photos.new(photo_params)
    if @photo.save
      redirect_to photos_path
    else
      flash[:notice] = "photo not provided"
      render :new
    end
  end

  def photo_params
    params.require(:photo).permit(:title, :image)
  end

  def index
    @photos = Photo.all
    @comment = Comment.new
  end

end
