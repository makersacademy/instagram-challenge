class PicturesController < ApplicationController

  skip_before_action :verify_authenticity_token
  before_action :authenticate_user!, :except => [:index, :show]

  def index
    @pictures = Picture.all
  end

  def new
    @picture = Picture.new
  end

  def create
    current_user.pictures.create(picture_params)
    redirect_to pictures_path
  end

  def picture_params
    params.require(:picture).permit(:title, :image)
  end

  def show
    @picture = Picture.find(params[:id])
  end

  def destroy
    @picture = Picture.find(params[:id])
    @picture.destroy
    flash[:notice] = 'Picture deleted successfully'
    redirect_to '/pictures'
  end

end
