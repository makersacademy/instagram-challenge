class PicturesController < ApplicationController

  def index
    @pictures = Picture.all
  end

  def new
  end

  def create
    Picture.create(picture_params)
    redirect_to '/pictures'
  end

  private
  def picture_params
    params.require(:picture).permit(:image, :description)
  end

end
