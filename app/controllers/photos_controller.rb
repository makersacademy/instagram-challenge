class PhotosController < ApplicationController

  before_action :authenticate_user!, :except => [:index, :show]

  def index
    @photos = Photo.all
  end

  def new
    @user = User.find(current_user.id)
    @photo = @user.photos.new
  end

  def create
    @user = User.find(current_user.id)
    @photo = @user.photos.new(photo_params)
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

  def destroy
    @photo = Photo.find(params[:id])
    if current_user.id == @photo.user_id
      @photo.destroy
      flash[:notice] = 'Photo deleted successfully'
      redirect_to photos_path
    else
      redirect_to photos_path
    end
  end

  def photo_params
    params.require(:photo).permit(:caption, :image)
  end
end
