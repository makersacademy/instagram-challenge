class InstagramController < ApplicationController

  def index
    @pictures = Picture.all
  end

  def new
    @add_picture = Picture.new
  end

  def create
    @add_picture = Picture.create(picture_params)
    redirect_to('/instagram')
  end

  private

  def picture_params
   params.require(:instagram).permit(:caption, :image)
  end

end
