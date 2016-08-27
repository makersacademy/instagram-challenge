class PicturesController < ApplicationController
  before_action :authenticate_user!, :except => [:index, :show]
  def index
    @pictures = Picture.all
  end

  def show
    @picture = Picture.find(params[:id])
  end

  def new
    @picture = current_user.pictures.new
  end

  def edit
    @picture = Picture.find(params[:id])
  end

  def create
    @picture = current_user.pictures.create(picture_params)
    redirect_to pictures_path
  end

  def update
    @picture = Picture.find(params[:id])
    @picture.update(picture_params)
    redirect_to pictures_path
  end

  def destroy
    @picture = Picture.find(params[:id])
    @picture.destroy
    flash[:notice] = 'Picture deleted successfully'
    redirect_to pictures_path
  end

  private

  def picture_params
    params.require(:picture).permit(:image, :caption)
  end
end
