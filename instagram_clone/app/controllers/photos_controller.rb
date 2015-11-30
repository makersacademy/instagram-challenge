class PhotosController < ApplicationController

  before_action :authenticate_user!, :except => [:index, :show]

  def index
    @photos = Photo.all
  end

  def new
    @photo = Photo.new
  end

  def show
    @photo = Photo.find(params[:id])
  end

  def edit
    @photo = Photo.find(params[:id])
  end

  def update
    @photo = Photo.find(params[:id])
    if @photo.user == current_user
      @photo.update(photo_params)
      redirect_to '/photos'
    else
      flash[:notice] = 'You cannot delete this picture'
    end
  end

  def create
    @photo = Photo.new(photo_params)
    @photo.user = current_user
    @photo.save!
    flash[:notice] = 'Picture uploaded successfully'
    redirect_to '/photos'
  end

  def destroy
    @photo = Photo.find(params[:id])
    if @photo.user == current_user
      @photo.destroy
      flash[:notice] = "Photo deleted successfully"
      redirect_to '/photos'
    else
      flash[:notice] = "You cannot delete this photo"
    end
  end

  def photo_params
    params.require(:photo).permit(:caption,:image)
  end
end
