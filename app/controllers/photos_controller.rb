class PhotosController < ApplicationController

  before_action :authenticate_user!, :except => [:index, :show]
  
  def index
    @photos = Photo.all
  end

  def new
    @user = current_user
    @photo = Photo.new
  end

  def create
    @photo = current_user.photos.create(photo_params)
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
    if current_user.id != @photo.user_id
      flash[:notice] = "Cannot edit this"
      redirect_to photos_path
    end
  end

  def update
    @photo = Photo.find(params[:id])
    @photo.update(photo_params)
    redirect_to '/photos'
  end

  def destroy
    @photo = Photo.find(params[:id])
    @photo.destroy
    flash[:notice] = 'Photo deleted successfully'
    redirect_to '/photos'
  end

  def photo_params
    params.require(:photo).permit(:title, :image)
  end
end
