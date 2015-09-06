class PhotosController < ApplicationController
  def index
    @photos = Photo.all
  end

  def new
    @photo = Photo.new
  end

  def create
    @photo = Photo.new(photo_params)
    if @photo.save
      redirect_to photos_path
    else
      flash[:notice] = @photo.errors.full_messages.join(', ')
      redirect_to new_photo_path
    end
  end

  def show
    @photo = Photo.find(params[:id])
  end

  def update
  end

  def destroy
  end

  def photo_params
    params.require(:photo).permit(:caption, :image)
  end
end
