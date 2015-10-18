class ImagesController < ApplicationController
  def index
    @images = Image.all
  end
  def new
    @image = Image.new
  end
  def create
    Image.create(image_params)
    redirect_to('/images')
  end
  def image_params
    params.require(:image).permit(:name, :image)
  end
  def show
    @image = Image.find(params[:id])
  end
  def edit
    @image = Image.find(params[:id])
  end
end
