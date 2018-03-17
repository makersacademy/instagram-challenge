class ImagesController < ApplicationController

  def index
    @images = Image.all
  end

  def new
    @image = Image.new
  end

  def create
    @image = Image.new(image_params)
    @image.save
    redirect_to images_url
  end

  def show
    @image = Image.find params[:id]
  end

  private

  def image_params
    params.require(:image).permit(:user, :caption, :image)
  end

end
