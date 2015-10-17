class ImagesController < ApplicationController

  before_action :authenticate_user!, :except => [:index, :show]
  
  def index
    @images = Image.all
  end

  def new
    @image = Image.new
  end

  def create
   Image.create(image_params)
   redirect_to '/images'
  end

  def show
    @image = Image.find(params[:id])
  end

  def destroy
    @image = Image.find(params[:id])
    @image.destroy
    flash[:notice] = 'Image deleted successfully'
    redirect_to '/images'
  end

  def image_params
    params.require(:image).permit(:name, :image)
  end
end
