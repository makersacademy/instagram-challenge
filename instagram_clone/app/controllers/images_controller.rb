class ImagesController < ApplicationController

  # permit(:title, :description, :picture)

  def index
    @images = Image.all
  end

  def new
    @image = Image.new
  end

  def create
    @user = current_user
    @image = Image.create(image_params)

    redirect_to images_path
  end

  def image_params
    params.require(:image).permit(:picture, :name)
  end
end
