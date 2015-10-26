class PicturesController < ApplicationController

  before_action :authenticate_user!, except: [:index, :show]

  def index
    @pictures = Picture.all
  end

  def new
    @picture = Picture.new
  end

  def create
  @picture = current_user.pictures.new(picture_params)
    if @picture.save
      redirect_to pictures_path
    else
      render 'new'
    end
  end

  def edit
    @picture = Picture.find(params[:id])
  end

  def update
    @picture = Picture.find(params[:id])
    @picture.update(picture_params)
    redirect_to '/pictures'
  end

  def destroy
    @picture = Picture.find(params[:id])
    if current_user == @picture.user
      @picture.destroy
      flash[:notice] = 'Post deleted successfully'
      redirect_to '/pictures'
    else
      flash[:notice] = 'You cannot delete that picture'
      redirect_to '/pictures'
    end
  end

  def picture_params
    params.require(:picture).permit(:description, :image)
  end
end
