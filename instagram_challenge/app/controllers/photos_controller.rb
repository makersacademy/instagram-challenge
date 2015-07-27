class PhotosController < ApplicationController
  before_action :authenticate_user!, :except => [:index, :show]

  def index
    @photos = Photo.all
  end

  def new
    @photo = Photo.new
  end

  def create
    @photo = Photo.new( photo_params )
    if @photo.save
      redirect_to photos_path
    else
      render 'new'
    end
  end

  def show
    @photo = Photo.find(params[:id])
  end

  def edit
    @photo = Photo.find(params[:id])
    if @photo.user != current_user
      flash[:notice] = "You can't edit someone else's photo"
      redirect_to photos_path
    end
  end

  def update
    @photo = Photo.find(params[:id])
    @photo.update(photo_params)
    redirect_to photos_path
  end

  def destroy
    @photo = Photo.find(params[:id])
    if @photo.user != current_user
      flash[:notice] = "You can't delete someone else's photo"
    else
      @photo.destroy
      flash[:notice] = "Photo deleted successfully"
    end
    redirect_to photos_path
  end

  def photo_params
    params[:photo][:user_id] = current_user.id
    params.require(:photo).permit(:title, :caption, :image, :user_id)
  end

end
