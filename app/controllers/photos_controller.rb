class PhotosController < ApplicationController

  before_action :authenticate_user!, :except => [:index, :show]

  def index
    @photos = Photo.all
  end

  def new
    @photo = Photo.new
  end

  def create
    @user = current_user
    @photo = @user.build_photo photo_params, current_user
    if !@photo.save
      flash[:notice] = 'You must upload a photo to post'
    end
    redirect_to photos_path
  end

  def photo_params
    params.require(:photo).permit(:title, :image)
  end

  def show
    @photo = Photo.find(params[:id])
  end

  def destroy
    @photo = Photo.find(params[:id])
    if current_user.id == @photo.user_id
      @photo.destroy
      flash[:notice] = 'Photo deleted successfully'
      redirect_to photos_path
    else
      redirect_to photos_path, alert: 'You can only delete photos you posted'
    end
  end


end
