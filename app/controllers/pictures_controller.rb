class PicturesController < ApplicationController
  before_action :authenticate_user!, :except => [:index, :show]

  def index
    @pictures = Picture.all
  end

  def new
    @picture = Picture.new
  end

  def create
    @picture = Picture.new(picture_params)
    @picture.user = current_user
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
  end

  def update
    @picture = Picture.find(params[:id])
    @picture.update(picture_params) if @picture.belongs_to?(current_user)
    redirect_to '/pictures'
  end

  def destroy
    @picture = Picture.find(params[:id])
    if @picture.belongs_to?(current_user)
      @picture.destroy
      flash[:notice] = 'Picture deleted successfully'
    end
    redirect_to '/pictures'
  end

private
  def picture_params
    params.require(:picture).permit(:title, :image)
  end

end
