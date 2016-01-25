class PhotosController < ApplicationController
  before_action :authenticate_user!

  def index
    @photos=Photo.all
  end

  def show
    @photo = Photo.find(params[:id])
  end

  def new
    @photo = Photo.new
  end

  def create
    @photo = Photo.create(photo_params)
    if @photo.save
      flash[:notice] = 'Nice, photo uploaded'
      redirect_to photos_path
    else
      flash[:alert] = 'Please upload photo'
      render :new
    end
  end

  def edit
    @photo = Photo.find(params[:id])
  end

  def update
    @photo = Photo.find(params[:id])
    @photo.update(photo_params)
    redirect_to(photos_path(@photo))
  end

  def destroy
    @photo = Photo.find(params[:id])
    @photo.destroy
      flash[:notice] = 'Chill...photo deleted'
      redirect_to photos_path
  end

  def photo_params
    params.require(:photo).permit(:image, :caption)
  end


end
