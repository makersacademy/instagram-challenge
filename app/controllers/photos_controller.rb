class PhotosController < ApplicationController

  before_action :authenticate_user!, :except => [:index, :show]

  before_action :require_permission, :only => [:edit, :destroy]

  def require_permission
    if current_user != Photo.find(params[:id]).user
      flash[:notice] = "You can't delete someone else's photo!"
      redirect_to root_path
    end
  end

  def index
    @photos = Photo.all
  end

  def new
    @photo = Photo.new
  end

  def create
    @user = current_user
    @photo = @user.photos.create(photo_params)
    if @photo.save
      redirect_to photos_path
    else
      render 'new'
    end
  end

  def show
    @photo = Photo.find(params[:id])
  end

  def edit
    @photo = Photo.find(params[:id])
  end

  def update
    @photo = Photo.find(params[:id])
    @photo.update(photo_params)
    redirect_to "/photos/#{@photo.id}"
  end

  def destroy
    @photo = Photo.find(params[:id])
    @photo.destroy
    flash[:notice] = 'Photo deleted successfully'
    redirect_to photos_path
  end

  private

  def photo_params
    params.require(:photo).permit(:image, :caption)
  end
end
