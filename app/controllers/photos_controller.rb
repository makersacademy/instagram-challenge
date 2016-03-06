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
   @photo.user_id = current_user.id
    if @photo.save
      redirect_to photos_path
    else
      render 'new'
    end
  end

  def destroy
    @photo = Photo.find(params[:id])
    if (@photo.user_id == current_user.id)
      @photo.destroy
      flash[:notice] = 'Photo deleted successfully'
    else
      flash[:notice] = 'This is not your photo to delete'
    end

    redirect_to '/photos'
  end


 def photo_params
   params.require(:photo).permit(:description, :image)
 end
end
