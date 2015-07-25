class PicturesController < ApplicationController
  def index
    @pictures = Picture.all
  end

  def new

  end

  def create
    Picture.create(picture_params)
    redirect_to pictures_path
  end

  def picture_params
    params.require(:picture).permit(:url, :image)
  end
end
