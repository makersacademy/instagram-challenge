class PicturesController < ApplicationController
  def index
    @pictures = Picture.all
  end

  def new
    @pictures = Picture.new
  end

  def create
    Picture.create(pic_params)
    redirect_to '/'
  end

  def pic_params
    params.require(:picture).permit(:title, :description, :image)
  end
end
