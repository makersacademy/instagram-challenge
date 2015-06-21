class PicturesController < ApplicationController
  before_action :authenticate_user!, :except => [:index, :show]

  def index
    @pictures = Picture.all
  end

  def new
    @picture = Picture.new
  end

  def create
    Picture.create(picture_params)
    redirect_to pictures_path
  end

  def picture_params
    params.require(:picture).permit(:title)
  end

  def show
    @picture = Picture.find(params[:id])
  end

end
