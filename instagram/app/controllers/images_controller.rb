class ImagesController < ApplicationController
  def index
    @images = Image.all
  end

  def new
  end

  def create
    @image = Image.create(image_params)
    redirect_to images_path
  end

  private

  def image_params
    params.require(:image).permit(:name, :image)
  end

end
