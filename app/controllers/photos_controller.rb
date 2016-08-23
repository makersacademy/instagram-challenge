class PhotosController < ApplicationController
  before_action :authenticate_user!
  before_action :find_photo, only: [:show, :edit, :update, :destroy]

  def index
    @photos=Photo.all.order("created_at DESC")
  end

  def show
    @photo = Photo.find(params[:id])
  end

  def new
    @photo = Photo.new
  end

  def create
    @photo = current_user.photos.new(photo_params)
    if @photo.save
      flash[:notice] = 'Nice, photo uploaded'
      redirect_to photos_path
    else
      flash[:alert] = 'Please upload photo'
      render :new
    end
  end

  def edit
  end

  def update
    if current_user.photos.include? @photo
      @photo.update(photo_params)
      redirect_to(photos_path(@photo))
    end
  end

  def destroy
    if current_user.photos.include? @photo
      @photo.destroy
      flash[:notice] = 'Chill...photo deleted'
    # else
    #   flash[:alert] = 'Only the owner can delete this'
    end
    redirect_to photos_path
  end

private

  def photo_params
    params.require(:photo).permit(:image, :caption)
  end

  def find_photo
    @photo = Photo.find(params[:id])
  end


end
