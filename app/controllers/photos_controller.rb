class PhotosController < ApplicationController
  before_action :authenticate_user!, :except => [:index]
  # before_action :photo_owner, :except =>[:index, :new, :create]


  # def photo_owner
  #   @photo = Photo.find(params[:id])
  #   unless @photo.user_id == current_user.id
  #     flash[:notice] = 'You are not authorised to change the photo'
  #     redirect_to photos_path
  #   end
  # end


  def index
    @photos = Photo.all.reverse
  end

  def new
    @photo = Photo.new
  end

  def create
    @user = User.find(current_user.id)
    @user.photos.create(photo_params)
    redirect_to photos_path
  end

  def destroy
    @photo = Photo.find(params[:id])
    @photo.destroy
    flash[:notice] = 'Photo deleted successfully'
    redirect_to photos_path
  end


  def photo_params
    params.require(:photo).permit(:description, :image)
  end
end
