class PicturesController < ApplicationController

  def new
    @add_picture = Picture.new
  end

  def create
    @add_picture = Picture.create(picture_params)
    redirect_to('/')
  end

  private

  def picture_params
   params.require(:picture).permit(:caption, :image)
  end


end
