class PhotosController < ApplicationController

  before_action :authenticate_user!, :except => [:index, :show]
  before_action :require_permission, :only => [:edit, :destroy]

  def index
    @photos = Photo.all
  end

  def new
    @photo = Photo.new
  end

  def create
    @photo = current_user.photos.new(photo_params)
    if @photo.save
      redirect_to '/photos'
    else
      render 'new'
    end
  end

  def show
    @user = current_user || User.new
    @photo = Photo.find(params[:id])
    @comment = Comment.new
  end

  def edit
    @photo = Photo.find(params[:id])
  end

  def update
    @photo = Photo.find(params[:id])
    @photo.update(photo_params)

    redirect_to '/photos'
  end

  def destroy
    @photo = Photo.find(params[:id])
    @photo.destroy
    flash[:notice] = 'Photo deleted successfully'
    redirect_to '/photos'
  end

  private

  def photo_params
    params.require(:photo).permit(:caption, :location, :image)
  end

  def require_permission
    if current_user.id != Photo.find(params[:id]).user_id
      redirect_to '/'
    end
  end
end
