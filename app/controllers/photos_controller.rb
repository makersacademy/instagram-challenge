class PhotosController < ApplicationController

  before_action :authenticate_user!, :except => [:index, :show]

  def index
    @photos = Photo.all
  end

  def new
    @photo = Photo.new
  end

  def create
    @photo = Photo.new(photo_params.merge({user: current_user}))
    if @photo.save
      redirect_to photos_path
    else
      render 'new'
    end
  end

  def photo_params
    params.require(:photo).permit(:caption, :image)
  end

  def show
    @photo = Photo.find(params[:id])
    @user = User.find(@photo.user_id)
    @username = @user.username
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

end
