class PhotosController < ApplicationController
 before_action :authenticate_user!, :except => [:index] 
  def index
    @photos = Photo.all
    @user = current_user
  end

  def new
    @photo = Photo.new
  end

  def create
    @user = current_user
    @user.photos.create(photo_params)
    redirect_to '/'
  end

  def destroy
    @photo = current_user.photos.find(params[:id])
  rescue
    flash[:notice] = 'You can only delete your own photos!'
    redirect_to '/'
  else
    @photo.destroy
    flash[:notice] = "Photo deleted successfully"
    redirect_to '/'
  end 

  def edit
    @photo = current_user.photos.find(params[:id])
  rescue 
    flash[:notice] = 'You can only edit your own photos!'
    redirect_to '/'
  end

  def update
    @photo = current_user.photos.find(params[:id])
    @photo.update(photo_params)
    redirect_to '/'
  end

def photo_params
  params.require(:photo).permit(:description, :image)
end

end
