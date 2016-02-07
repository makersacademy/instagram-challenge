class PhotosController < ApplicationController
  before_action :authenticate_user!
  # before_action :check_author, :only => [:destroy]
  #
  # def check_author
  #   if current_user != Photo.find(params[:id]).user_id
  #     redirect_to photos_path
  #   end
  # end

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
    @photo = Photo.find(params[:id])
  end

  def update
    @photo = Photo.find(params[:id])
    @photo.update(photo_params)
    redirect_to(photos_path(@photo))
  end

  def destroy
    @photo = Photo.find(params[:id])
    if current_user.photos.include? @photo
      @photo.destroy
      flash[:notice] = 'Chill...photo deleted'
    else
      flash[:alert] = 'Only the owner can delete this'
    end
    redirect_to photos_path
  end

private

  def photo_params
    params.require(:photo).permit(:image, :caption)
  end


end
