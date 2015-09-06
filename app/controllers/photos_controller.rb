class PhotosController < ApplicationController
  before_action :authenticate_user!, :except => [:index, :show]

  def index
    @photos = Photo.all
  end

  def new
    @photo = Photo.new
  end

  def create
    @photo = Photo.create(photo_params)
    @photo.update(user_id: current_user.id)
    redirect_to '/photos'
  end
  def show
    @photo = Photo.find(params[:id])
  end

  def destroy
    @photo = Photo.find(params[:id])
    if @photo.user_id == current_user.id
      @photo.destroy
      flash[:notice] = 'Photo deleted successfully'
    else
      flash[:notice] = 'You cannot delete this picture!'
    end
    redirect_to '/photos'
  end

  def photo_params
    params.require(:photo).permit(:name, :image)
  end
end
