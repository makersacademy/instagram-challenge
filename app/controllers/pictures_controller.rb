class PicturesController < ApplicationController

  before_action :authenticate_user!
  
  def new
    @picture = Picture.new
  end

  def create
    @picture = Picture.create(picture_params)
    redirect_to picture_url
  end

  def index
    @picture = Picture.all
    @users = User.all
  end

  private

  def picture_params
    params.require(:picture).permit(:url)
  end
  
end
