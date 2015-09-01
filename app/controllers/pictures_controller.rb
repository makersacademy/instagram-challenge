class PicturesController < ApplicationController

  before_action :authenticate_user!, :except => [:index, :show]
  def index
    @pictures = Picture.all
  end

  def new
    @picture = Picture.new
  end

  def create
    @picture = current_user.pictures.build(picture_params)
    if @picture.save
      redirect_to '/pictures'
    else
      render 'new'
    end
  end

  def destroy
    @picture = Picture.find(params[:id])
    if @picture.destroy_as current_user
      flash[:notice] = 'Picture deleted successfully'
    else
      flash[:notice] = 'You cannot delete this picture'
    end
    redirect_to '/pictures'
  end

  def picture_params
    params.require(:picture).permit(:caption, :image)
  end
end
