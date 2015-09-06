class FeedsController < ApplicationController
  def index
    @images = Image.all
  end

  def new
    @image = Image.new
  end

  def create
    @image = current_user.images.create(image_params)
    redirect_to root_path
  end

  def image_params
    params.require(:image).permit(:pic)
  end
end
