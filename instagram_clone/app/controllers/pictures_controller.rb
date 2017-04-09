class PicturesController < ApplicationController
  before_action :authenticate_user!, :except => [:index]

  def index
    @pictures = Picture.all
  end

  def new
    @picture = Picture.new
  end

  def create
    @picture = Picture.new(picture_params)
    @picture.save
    flash[:notice] = "Image uploaded successfully."
    redirect_to pictures_path
  end

  def show
    @picture = Picture.find(params[:id])
  end

  private

  def picture_params
    params.require(:picture).permit(:image)
  end
end
