class PhotosController < ApplicationController
  def index
    @photos = Photo.order('created_at')
  end

  def new
    if current_user == nil
      flash[:notice] = "You must be logged in to add a photo!"
      redirect_to new_user_session_path
    end

    @photo = Photo.new
  end

  def create
    @photo = Photo.new(photo_params)

    if @photo.save
      flash[:notice] = "Successfully added a photo!"
      redirect_to root_path
    else
      flash[:alert] = "Error adding photo!"
      render :new
    end
  end

  def destroy
    @photo = Photo.find(params[:id])

    if @photo.destroy
      flash[:notice] = "Photo deleted"
      redirect_to root_path
    else
      flash[:alert] = "Error deleting photo"
    end
  end

  private
  def photo_params
    params.require(:photo).permit(:title, :image, :user_id)
  end
end
