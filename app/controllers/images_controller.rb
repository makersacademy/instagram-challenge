class ImagesController < ApplicationController

  def index
    @images = Image.all
  end

  def new

  end

  def create
    @image = Image.create(image_params)
    if @image.save
      redirect_to images_path
    else
      render 'new'
    end
  end

  def image_params
    params.require(:image).permit(:title)
  end

end
