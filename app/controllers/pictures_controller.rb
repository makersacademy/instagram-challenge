class PicturesController < ApplicationController
  def index
  end

  def new
    @picture = Picture.new
  end

  def create
    @picture = Picture.new(picture_params)
  end

  private

  def picture_params
    params.require(:picture).permit(:image)
  end
end
