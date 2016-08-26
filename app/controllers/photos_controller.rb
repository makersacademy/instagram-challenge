class PhotosController < ApplicationController

  before_action :authenticate_user!, except: [:index, :show]

  def new
    @photo = Photo.new
  end

  def create
    @photo = Photo.new(photo_params)
    if @photo.save
      flash[:notice] = "Photo has been successfully added"
    else
      flash[:error] = "There's been an error adding your photo"
    end
    redirect_to root_path
  end

  private

  def photo_params
    params.require(:photo).permit(:photo_url, :description)
  end

end
