class PicturesController < ApplicationController

  def index
    @pictures = Picture.all
  end

  def new
    @picture = Picture.new
  end

  def create
    @picture = Picture.new(picture_params)
    redirect_to '/pictures'
  end

  private

  def picture_params
    params.require(:picture).permit(:image)
  end

end
