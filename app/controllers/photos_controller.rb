class PhotosController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
  end

  def new
    @photo = Photo.new
  end

  def create
    params[:photo][:user_id] = current_user
    p photo_params
    @photo = Photo.create( photo_params )
  end

  def destroy
    @photo = Photo.first(params[:id])
    if @photo.user == current_user
      @photo.destroy
      flash[:notice] = 'Photo successfully deleted'
    else
      flash[:notice] = 'Unsupported action'
    end
    redirect_to photos_path
  end

  private

  def photo_params
    params.require(:photo).permit(:gram, :user_id)
  end
end
