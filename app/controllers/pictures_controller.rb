class PicturesController < ApplicationController

  before_action :authenticate_user!, :except => [:index, :show]

  def index
    @pictures = Picture.all
  end

  def new
    @picture = Picture.new
  end

  def create
    @picture = Picture.new(picture_params)
    if @picture.save
      redirect_to pictures_path
    else
      render 'new'
    end
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

  private

  def picture_params
    params.require(:picture).permit(:title, :url)
  end
end
