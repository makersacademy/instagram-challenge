class ImagesController < ApplicationController
  
  def index
    @images = Image.all
  end

  def new
  end

  def create
    Image.create(restaurant_params)
    redirect_to ('/images')
  end

  def restaurant_params
    params.require(:image).permit(:name, :description, :image)
  end
end
