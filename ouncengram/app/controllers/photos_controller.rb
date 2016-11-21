class PhotosController < ApplicationController

  before_action :authenticate_user!, :except => [:index, :show]

  def index
    @photos = Photo.all
    @comment = Comment.new
  end

  def new
    @photo = Photo.new
  end

  def create
    @photo = Photo.new(photo_params)
    @photo.user_id = current_user.id
    if @photo.save
      redirect_to photos_path
    else
      render 'new'
    end
  end

  def edit
    @photo = Photo.find(params[:id])
  end

  def update
    @photo = Photo.find(params[:id])
    if @photo.user_id == current_user.id
      @photo.update(photo_params)
      redirect_to photos_path, notice: 'Photo successfully updated'
    else
      redirect_to photos_path, alert: "Cannot edit other users photo's "
    end
  end

  def destroy
    @photo = Photo.find(params[:id])
    if @photo.user_id == current_user.id
      @photo.destroy
      redirect_to photos_path, notice: 'Photo successfully deleted'
    else
      redirect_to photos_path, alert: "Cannot delete other users photo's "
    end
  end

  def photo_params
    params.require(:photo).permit(:name, :description, :image)
  end

end
