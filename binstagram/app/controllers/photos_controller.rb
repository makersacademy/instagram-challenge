class PhotosController < ApplicationController
  
  before_action :authenticate_user!, :except => [:index, :show]

  def photo_params
    params.require(:photo).permit(:image, :name, :description)
  end

  def index
    @photo = Photo.all
  end

  def new
    @photo = Photo.new
  end

  def show
    @photo = Photo.find(params[:id])
  end

  def create
    @photo = Photo.new(photo_params.merge(user: current_user))
    if @photo.save
      redirect_to photos_path
    else
      render 'new'
    end
  end

end
