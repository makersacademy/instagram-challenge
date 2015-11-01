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
      flash[:notice] = 'Successfully posted'
      redirect_to photos_path
    else
      flash[:errors] = @photo.errors.full_messages
      p flash[:errors]
      redirect_to new_photo_path
    end
  end

  def destroy
    @photo = Photo.find(params[:id])
    @photo.destroy
    flash[:notice] = 'Pic removed'
    redirect_to photos_path
  end

  private

  def photo_params
    params.require(:photo).permit(:image, :description)
  end

end
