class PhotosController < ApplicationController

  before_action :authenticate_user!, :except => [:index, :show]

  def index
    @photo = Photo.all
  end

  def new
    @photo = current_user.photos.build
  end

  def create
    @photo = current_user.photos.build(photos_params)

    if @photo.save
      redirect_to photos_path
    else
      flash[:alert] = "Your new photo could not be posted. Please check the form."
      render :new
    end
  end

  def destroy
    @photo = Photo.find(params[:id])
    @photo.destroy
    flash[:notice] = 'Photo deleted successfully'
    redirect_to '/photos'
  end

  def edit
    @photo = Photo.find(params[:id])
  end

  def update
    @photo = Photo.find(params[:id])
    @photo.update(caption_params)
    redirect_to '/photos'
  end

  def show
  @photo = Photo.find(params[:id])
  end

  private
  def photos_params
    params.require(:photo).permit(:image, :caption)
  end

  def caption_params
    params.require(:photo).permit(:caption)
  end


end
