class ImagesController < ApplicationController
  before_action :authenticate_user!, :except => [:index]

  def index
    @images = Image.all
  end

  def new
    @image = Image.new
  end

  def create
    # @image = Image.create(image_params)
    @image = Image.create()
    redirect_to '/images'
  end

  def destroy
    @image = Image.find(params[:id])
    @image.destroy
    flash[:notice] = 'Image deleted successfully'
    redirect_to '/images'
  end

  private

  def image_params
    params.require(:image).permit(:name)
  end
end
