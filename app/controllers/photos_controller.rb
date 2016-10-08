class PhotosController < ApplicationController

before_action :authenticate_user!

before_action :set_post, only: [:show, :edit, :update, :destroy]

  def index
    @photos = Photo.all
  end

  def new
    @photo = current_user.photos.build
  end

  def create
     @photo = current_user.photos.build(photo_params)

      if @photo.save
        flash[:success] = "Your post has been created!"
        redirect_to photos_path
      else
        flash.now[:alert] = "Your new post couldn't be created! Please check the form."
        render :new
  end
  end

  def show
  end

  def edit
  end

  def update
    if @photo.update(photo_params)
      flash[:success] = "Post Updated."
      redirect_to photos_path
  else
    flash.now[:alert] = "Update failed. Please check the form."
    render :edit
  end
  end

  def destroy
    @photo.destroy
    flash[:alert] = "Your post is being deleted!"
    redirect_to photos_path
  end

private
  def photo_params
    params.require(:photo).permit(:image, :caption)
  end

  def set_post
    @photo = Photo.find(params[:id])
  end

end
