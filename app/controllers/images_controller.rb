class ImagesController < ApplicationController
  def image_params
    params.require(:image).permit(:title, :image)
  end

  def new
    @image = Image.new
  end

  def index
    @images = Image.all
  end

  def create
    Image.create(image_params)
    redirect_to images_url
  end
end
