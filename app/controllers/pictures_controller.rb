class PicturesController < ApplicationController

  skip_before_action :authenticate_user!, only: [:show, :index]

  def index
    @pictures = Picture.all
  end

  def new
  end

  def show
    @picture = Picture.find(params[:id])
    p @picture.image
  end

  def create
    p params
    @picture = Picture.new(picture_params)
    @picture.save
    redirect_to @picture
  end

  private
    def picture_params
      params.require(:picture).permit(:image, :description)
    end


end
