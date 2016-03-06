class PicturesController < ApplicationController

  def index
    @pictures = Picture.all.reverse
  end

  def new
    @picture = Picture.new
  end

  def create
    @picture = Picture.create(picture_params)
    redirect_to pictures_path
  end

  def picture_params
    params.require(:picture).permit(:image, :caption)
  end

end
