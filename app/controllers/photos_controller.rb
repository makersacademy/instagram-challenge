class PhotosController < ApplicationController

  before_action :authenticate_user!, :except => [:index, :show]

  def index
    @photos = Photo.all
  end

  def new
    @photo = Photo.new
  end

  def create
    @photo = Photo.create(photo_params)
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
    redirect_to '/photos'
  end

  def destroy
    @photo = Photo.find(params[:id])
    if @photo.user === current_user
      @photo.destroy
      flash[:notice] = 'Photo deleted successfully'
    else
      flash[:notice] = "You cannot delete this photo"
    end
    redirect_to '/photos'
  end

  def photo_params
    params[:photo][:user_id] = current_user.id
    params.require(:photo).permit(:title, :image, :user_id)
  end

end
