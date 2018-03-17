class PhotosController < ApplicationController

  def index
    @photos = Photo.all
  end

  def new
    @photo = Photo.new
  end

  def create
    @photo = Photo.new(photo_params)
    if @photo.save
      flash[:notice] = "Photo has been saved"
      redirect_to '/photos'
    else
      flash[:notice] = "Please add the description"
      render :new
    end
  end

  private

  def photo_params
    params.require(:photo).permit(:description)
  end

end
