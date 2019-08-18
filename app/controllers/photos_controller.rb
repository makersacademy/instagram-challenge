class PhotosController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @photos = Photo.all
  end

  def show
    @photo = Photo.find(params[:id])
  end

  def new
    @photo = current_user.photos.build
  end

  def create

    @photo = current_user.photos.build(photo_params)

    if @photo.save
      redirect_to @photo
    else
      render 'new'
    end
  end

  def destroy
    @photo = Photo.find(params[:id])
    @photo.destroy

    redirect_to photos_path
end

  private
    def photo_params
      params.require(:photo).permit(:image, :caption)
    end

end
