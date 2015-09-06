class PicturesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def index
    @pictures = Picture.all
  end

  def new
    @picture = Picture.new
  end

  def create
    @picture = current_user.pictures.new(picture_params)
    if @picture.save
      redirect_to root_path
      flash[:notice] = "Picture successfully posted"
    else
      redirect_to new_picture_path
      flash[:notice] = "You must provide an image file to upload"
    end
  end

  
  private

  def picture_params
    params.require(:picture).permit(:title, :image)
  end

end
