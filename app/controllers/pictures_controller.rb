class PicturesController < ApplicationController
  before_action :authenticate_user!, :except => [:index]

  def picture_params
    params.require(:picture).permit(:image)
  end

  def index
    @pictures = Picture.all
  end

  def new
    @picture = Picture.new
  end

  def create
    @picture = current_user.pictures.new(picture_params)
    # @picture = Picture.new(picture_params, user: current_user)

    if @picture.save
      redirect_to pictures_path
    else
      render 'new'
    end
  end

end
