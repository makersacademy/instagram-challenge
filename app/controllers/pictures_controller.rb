class PicturesController < ApplicationController

  before_action :authenticate_user!

  def index
    @pictures = Picture.all
  end

  def new
    @picture = Picture.new
  end

  def create
    Picture.create_with_user(picture_params, current_user)
    redirect_to pictures_path
  end

  def destroy
    @picture = Picture.find(params[:id])
    if @picture.user == current_user
      @picture.destroy
      flash[:notice] = 'Picture deleted successfully'
      redirect_to pictures_path
    else
      flash[:notice] = 'Sorry, you may only delete your own picture'
      redirect_to pictures_path
    end
  end

  def picture_params
    params.require(:picture).permit(:title, :image)
  end
end
