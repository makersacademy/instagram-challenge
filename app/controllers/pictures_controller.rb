class PicturesController < ApplicationController
  before_action :authenticate_user!

  def index
    @pictures = Picture.all
  end

  def new
    @picture = Picture.new
  end

  def create
    @picture = Picture.create(pictures_params)
    redirect_to pictures_url
  end

  private

  def pictures_params
    params.require(:picture).permit(:title, :image)
  end

end
