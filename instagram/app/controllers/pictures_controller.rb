class PicturesController < ApplicationController

  def index
    @pictures = Picture.all
  end

  def new
    @picture = Picture.new
  end

  def create
    @user = User.create ( user_params )
  end

  def user_params
    params.require(:user).permit(:image) #may need to add extra criteria to strong params
  end


end
