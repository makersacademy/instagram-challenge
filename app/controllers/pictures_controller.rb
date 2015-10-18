class PicturesController < ApplicationController

  before_action :authenticate_user!

  def index
    @pictures = Picture.all.order('created_at DESC')
  end

  def new
    @picture = Picture.new
  end

  def create
    Picture.create(picture_params)
    redirect_to pictures_path
  end

  def destroy
    @picture = Picture.find(params[:id])
    @picture.destroy
    flash[:notice] = 'Picture deleted successfully'
    redirect_to pictures_path
  end

  def picture_params
    params.require(:picture).permit(:image)
  end

end

