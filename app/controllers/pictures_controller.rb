class PicturesController < ApplicationController

  def index
    @pictures = Picture.all
  end

  def new
    @picture = Picture.new
  end

  def create
    Picture.create(restaurant_params)
    redirect_to pictures_path
  end

  def restaurant_params
    params.require(:picture).permit(:title, :image)
  end
end
