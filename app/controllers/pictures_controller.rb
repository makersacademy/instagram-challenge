class PicturesController < ApplicationController
  def index
    @pictures = Picture.all
  end

  def new
    @picture = Picture.new
  end

  def create
    Picture.create(picture_params)
    redirect_to '/pictures'
  end

  def show
    @picture = Picture.find(params[:id])
  end

  private

  def picture_params
    params.require(:picture).permit(:title, :url)
  end
end
