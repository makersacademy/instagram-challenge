class PhotosController < ApplicationController
  def index
    @photos=Photo.all
  end

  def new
    @photo = Photo.new
  end

  def create
    @photo = Photo.create(photo_params)
    if @photo.save
      flash[:notice] = 'Nice, photo uploaded'
      redirect_to photos_path
    else
      flash[:alert] = 'Please upload photo'
      render :new
    end
  end

  def photo_params
    params.require(:photo).permit(:image, :caption)
  end


end
