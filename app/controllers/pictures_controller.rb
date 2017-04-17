class PicturesController < ApplicationController
  def index
    @pictures = Picture.all
  end

  def new
    @picture= Picture.new
  end

  def create
    Picture.create(picture_params)
    redirect_to '/pictures'
  end

  def picture_params
    params.require(:picture).permit(:title)
  end

end
