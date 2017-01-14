class PhotosController < ApplicationController

  before_action :authenticate_user!, :except => [:index, :show]
  before_action :photo_belongs_to_current_user?, :only => [:edit, :update, :destroy]

  def index
    @photos = Photo.all
  end

  def new
    @photo = Photo.new
  end

  def create
    user = User.find(current_user.id)
    @photo = user.photos.new(photo_params)

    if @photo.save
      redirect_to photos_path
    else
      render :new
    end

  end

  def show
    @photo = Photo.find(params[:id])
  end

  def edit
  end

  def update
    @photo.update(photo_params)
    redirect_to photo_path(@photo)
  end

  def destroy
    @photo.destroy
    flash[:notice] = "Photo deleted"
    redirect_to photos_path
  end

  private

  def photo_params
    params.require(:photo).permit(:name, :image)
  end

  def photo_belongs_to_current_user?
    @photo = Photo.find(params[:id])
    if current_user.id != @photo.user_id
      flash[:notice] = "Cannot edit or delete a photo you did not create"
      redirect_to root_path
    end
  end

end
