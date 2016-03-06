class PicturesController < ApplicationController
  def index
    @pictures = Picture.all
  end

  def show
    @picture = Picture.find(params[:id])
  end

  def new
    @picture = Picture.new
  end

  def edit
    @picture = Picture.find(params[:id])
  end

  def create
    @picture = Picture.create(picture_params)
    redirect_to pictures_path
  end

  def update
    @picture = Picture.find(params[:id])
    @picture.update(picture_params)
    redirect_to(picture_path(@picture))
  end

  private

  def picture_params
    params.require(:picture).permit(:image, :caption)
  end
end
