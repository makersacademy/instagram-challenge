class PicturesController < ApplicationController

  def index
    @pictures = Picture.all
  end

  def show
    @pictures = Picture.all
  end

  def new
    @pictures = Picture.new
  end

  def create
    Picture.create(picture_params)
    redirect_to '/pictures'
  end

  private

  def picture_params
    params.require(:picture).permit([:description])
  end

end
