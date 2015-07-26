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
    if @photo.save
      redirect_to photos_path
    else
      flash[:alert] = 'Please choose an image'
      render :new
    end
  end

  def show
  	@photo = Photo.find(params[:id])
  end

  def destroy
    @photo = Photo.find(params[:id])
    if @photo.user === current_user
      @photo.destroy
      flash[:notice] = 'Photo removed successfully'
    else
      flash[:notice] = "Photo can only be deleted by creator"
    end
    redirect_to '/photos'
  end

  def photo_params
  	params[:photo][:user_id] = current_user.id
    params.require(:photo).permit(:description, :image, :user_id)
  end
end
