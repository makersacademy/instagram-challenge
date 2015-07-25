class PicturesController < ApplicationController

  before_action :authenticate_user!, :except => [:index, :show]
  def index
    @pictures = Picture.all
  end

  def new
    @picture = Picture.new
  end

  def create
    user = current_user
    @picture = user.pictures.build(picture_params)
    if @picture.save
      redirect_to '/pictures'
    else
      render 'new'
    end
  end

  def picture_params
    params.require(:picture).permit(:caption, :image)
  end
end
