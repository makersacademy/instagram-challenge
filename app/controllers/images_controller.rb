class ImagesController < ApplicationController

  def index
    @images = Image.all
  end

  def new
  end

  def create
    Image.create(image_params)
    redirect_to '/images'
  end

  def show
    @image = Image.find(params[:id])
  end

  def image_params
    params.require(:image).permit(:description)
  end
end
