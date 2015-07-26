class PhotosController < ApplicationController
  before_action :authenticate_user!, :except => [:index, :show]
  
  def index
    @photos = Photo.all
  end 
  
  def new
    if current_user
      @user = current_user
      @photo = Photo.new
    end
  end
  
  def create 
    @user = current_user
    @photo = @user.photos.build_with_user(photo_params, @user)
    if @photo.save
      redirect_to root_path
    else
      render 'new'
    end
  end
  
  def show
    @photo = Photo.find(params[:id])
  end
  
  def destroy 
    @photo = Photo.find(params[:id])
    if @photo.destroy_as current_user
      flash[:notice] = 'Photo successfully deleted'
    else 
      flash[:notice] = 'You can only delete a photo which you added'
    end
    redirect_to root_path
  end
  
  def photo_params
    params.require(:photo).permit(:name, :description, :image)
  end

end
