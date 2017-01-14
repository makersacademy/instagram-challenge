class PicturesController < ApplicationController

  def index
    @pictures = Picture.all
  end

  def new
    @picture = Picture.new
  end

  private

  def params_image
    params.require(:picture).permit(:image)
  end

end
