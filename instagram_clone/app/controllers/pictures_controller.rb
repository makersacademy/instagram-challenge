class PicturesController < ApplicationController

  def index
    @pictures = Picture.all
  end

  def new
    @pictures = Picture.all
  end

  def create
    @picture = Picture.new(picture_params)
    if @picture.save
      redirect_to '/pictures'
    else
      render 'new'
    end
  end

  def picture_params
    params.require(:picture).permit(:caption, :image)
  end
end
