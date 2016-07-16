class PicturesController < ApplicationController
  def index
    @pictures = Picture.all
  end

  def new
  end

  def create
    Picture.create(picture_parameters)
    redirect_to pictures_path
  end

  def picture_parameters
    params.require(:picture).permit(:title, :description,:photo)
  end
end
