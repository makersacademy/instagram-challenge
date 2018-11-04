class PicturesController < ApplicationController

  before_action :authenticate_user!

  def new
    @picture = Picture.new
  end

  def create
    @picture = Picture.create(picture_params)
    redirect_to pictures_index_url
  end

  def index
    @pictures = Picture.all
    @users = User.all
  end

  private

  def picture_params
    params.require(:picture).permit(:image, :caption)
  end

end
