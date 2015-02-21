class PicturesController < ApplicationController

before_action :authenticate_user!

  def index
    @pictures = Picture.all
  end

  def new
    @picture = Picture.new
  end

  def create
    picture = Picture.create(picture_params)
    picture.user = current_user
    picture.save
    redirect_to '/'
  end

  def picture_params
    params.require(:picture).permit(:name, :image)
  end

  def show
    @picture = Picture.find(params[:id])
  end

  def destroy
    @picture = Picture.find(params[:id])
    @picture.destroy
    flash[:notice] = 'Picture Deleted Successfully'
    redirect_to '/'
  end

end
