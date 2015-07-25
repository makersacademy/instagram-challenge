class PhotosController < ApplicationController

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
      render 'new'
    end
  end
  
  def show
    @photo = Photo.find(params[:id])
  end
  
  def destroy 
    @photo = Photo.find(params[:id])
    if @photo.destroy 
      flash[:notice] = 'Photo successfully deleted'
    end
    redirect_to root_path
  end
  
  def photo_params
    params.require(:photo).permit(:name, :description, :image)
  end

end
