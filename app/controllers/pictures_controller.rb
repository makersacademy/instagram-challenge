class PicturesController < ApplicationController
  before_action :authenticate_user!

  def index
    @pictures = Picture.all
  end

  def new
    @pictures = Picture.new
  end

  def create
    @picture = current_user.pictures.build(pic_params)
    if @picture.save
      redirect_to "/"
    else
      render 'new'
    end
  end

  def show
    @picture = Picture.find(params[:id])
  end

  def destroy
    @picture = Picture.find(params[:id])
    @picture.destroy
    flash[:notice] = 'Picture deleted successfully'
    redirect_to '/'
  end

  def pic_params
    params.require(:picture).permit(:title, :description, :image)
  end
end
