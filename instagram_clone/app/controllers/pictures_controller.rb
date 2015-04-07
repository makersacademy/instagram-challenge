class PicturesController < ApplicationController

  def index
    @pictures = Picture.all
  end

  def new
    @picture = Picture.new
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
    params.require(:picture).permit(:title, :image)
  end

  def show
    @picture = Picture.find(params[:id])
  end

end
