class PicturesController < ApplicationController

  def index
    @pictures = Picture.all
  end

  def new
    @picture = Picture.new
  end

  def create
    current_user.pictures.create(picture_params)
    redirect_to pictures_path
  end

  def destroy
    Picture.find(params[:id]).destroy
    flash[:notice] = 'Picture deleted successfully'
    redirect_to pictures_path
  end

  def picture_params
    params.require(:picture).permit(:caption, :name, :image)
  end

end
