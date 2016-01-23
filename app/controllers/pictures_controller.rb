class PicturesController < ApplicationController

  before_action :authenticate_user!

  def index
    @pictures = Picture.all
  end

  def new
    @picture = Picture.new
  end

  def create
    Picture.create(restaurant_params)
    redirect_to pictures_path
  end

  def destroy
    @picture = Picture.find(params[:id])
    @picture.destroy
    flash[:notice] = 'Picture deleted successfully'
    redirect_to pictures_path
  end

  def restaurant_params
    params.require(:picture).permit(:title, :image)
  end
end
