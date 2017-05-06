class PicturesController < ApplicationController

  def index
    @pictures = Picture.all
  end

  def new
    @picture = Picture.new
  end

  def create
    # require 'pry'; binding.pry
    picture = Picture.new(picture_params)
    picture.user = current_user
    picture.save
    redirect_to '/pictures'
  end

  def show
    @picture = Picture.find(params[:id])
  end

  def destroy
    @picture = Picture.find(params[:id])
    @picture.destroy
    flash[:notice] = 'picture deleted'
    redirect_to '/pictures'
  end

  def picture_params
    params.require(:picture).permit(:caption, :image)
  end

end
