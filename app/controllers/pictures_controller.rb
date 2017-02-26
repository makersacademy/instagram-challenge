class PicturesController < ApplicationController

  def index
    @pictures = Picture.all
  end

  def new
    @picture = Picture.new
  end

  def create
    @picture = Picture.create(picture_params)
    redirect_to '/pictures'
  end

  def destroy
    @picture = Picture.find(params[:id])
    @picture.destroy
    redirect_to '/pictures'
  end

  private

  def picture_params
   params.require(:picture).permit(:description)
 end

end
