class PhotosController < ApplicationController
  def index
    @photos = Photo.all.reverse
  end

  def new
    @photo = Photo.new
  end

  def create
    @user = current_user
    @photo = @user.photos.new(photo_params)
    if @photo.save
      redirect_to photos_path, notice: 'Photo was successfully uploaded.'
    else
      render action: 'new'
    end
  end

  private
  def photo_params
    params.require(:photo).permit(:description, :image)
  end
end
