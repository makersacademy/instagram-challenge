class ImagesController < ApplicationController
  def index
    @images = Image.all
  end

  def new
    @image = Image.new
  end

  def create
    @image = Image.create(image_params)
    redirect_to images_path
  end

  def show
    @image = Image.find(params[:id])
  end


  private

  def image_params
    params.require(:image).permit(:name, :image)
  end

end
