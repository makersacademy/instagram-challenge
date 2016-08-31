class PhotosController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_photo, only: [:show, :edit, :update, :destroy]

  def index
    @photos = Photo.all
  end

  def new
    @photo = Photo.new
  end

  def create
    if @photo = Photo.user_create_photo(photo_params, current_user.id)
      flash[:notice] = "Your photo has been created"
      redirect_to photos_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @photo.update(photo_params)
      flash[:notice] = "Photo has been updated"
      redirect_to photos_path
    else
      render :edit
    end
  end

  def destroy
    @photo.destroy
    flash[:notice] = "Photo deleted successfully"
    redirect_to photos_path
  end

  private

    def photo_params
      params.require(:photo).permit(:caption, :image)
    end

    def set_photo
      @photo = Photo.find(params[:id])
    end
end
