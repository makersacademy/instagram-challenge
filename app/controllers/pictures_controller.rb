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

  def show
    @picture = Picture.find(params[:id])
  end

  def edit
    @picture = Picture.find(params[:id])
    if current_user.id === @picture.user_id
      @picture = Picture.find(params[:id])
    else
      flash[:notice] = 'You do not have permission to edit this picture'
      redirect_to '/pictures'
    end
  end

  def update
    @picture = Picture.find(params[:id])
    if @picture.update(picture_params)
      redirect_to '/pictures'
    else
      render 'new'
    end
  end

  def destroy
    @picture = Picture.find(params[:id])
    if current_user.id === @picture.user_id
      @picture.destroy
      flash[:notice] = 'Picture deleted successfully'
      redirect_to '/pictures'
    else
      flash[:notice] = 'You do not have permission to delete this picture'
      redirect_to '/pictures'
    end
  end

  def picture_params
    params.require(:picture).permit(:image, :descr)
  end
end
