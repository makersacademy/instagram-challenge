class PhotoController < ApplicationController

  def index
    @photos = Photo.all
  end

  def new
    user_signed_in? ? (@photo = Photo.new) : (redirect_to action:"index")
  end

  def create
    @user = User.find(current_user.id)
    @photo = @user.photos.create(photo_params)
    redirect_to "/photo"
  end

  def show
    @photo = Photo.find(params[:id])
    @check = @photo.user.id == current_user.id
    @comments = @photo.comments
  end

  def destroy
    @photo = Photo.find(params[:id])
    @photo.destroy
    redirect_to "/photo"
  end

  private

  def photo_params
    params[:photo].permit(:description, :image)
  end

end
