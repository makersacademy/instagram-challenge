class PhotosController < ApplicationController
  before_action :authenticate_user!
  before_action :edit_security_check, only: [:edit, :update]

  def index
    @photos = Photo.all.reverse
  end

  def show
    @photo = Photo.find(params[:id])
  end

  def new
    @photo = Photo.new
  end

  def edit
    @photo = Photo.find(params[:id])
  end

  def create
    @user = current_user
    @photo = @user.photos.new(photo_params)
    if @photo.save
      redirect_to profile_path(@user), notice: 'Photo was successfully uploaded.'
    else
      render action: 'new'
    end
  end

  def update
    @photo = Photo.find(params[:id])
    @photo.update(photo_params)
    redirect_to photo_path(@photo)
  end

  def destroy
    @photo = Photo.find(params[:id])
    if @photo.user == current_user
      @photo.destroy
    end
    redirect_to profile_path(current_user.username)
  end

  private
  def photo_params
    params.require(:photo).permit(:description, :image)
  end

  def edit_security_check
    redirect_to root_path unless current_user == Photo.find(params[:id]).user
  end
end
