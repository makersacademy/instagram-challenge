class PicturesController < ApplicationController
  def list
    @picture = Picture.new
    @pictures = Picture.all
    p "PICTURES: #{@pictures}"
  end

  def create
    p params
    picture = Picture.new(picture_params)
    redirect_to '/pictures'
  end

  private

  def picture_params
    params.require(:picture).permit(:title, :description, :img_url)
  end
end
