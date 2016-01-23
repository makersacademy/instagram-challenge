class PicturesController < ApplicationController
  before_action :authenticate_user!, :except => [:index, :show]

  def index
    @pictures = Picture.all
  end

  def create
    @picture = current_user.pictures.new(picture_params)
    if @picture.save
      redirect_to pictures_path
    else
      redirect_to pictures_new_path
      flash[:notice] = 'An error has occurred.'
    end
  end

  def new
    @picture = Picture.new
  end

  def show
    @pictures = Picture.find(params[:id])
  end

  def destroy
    @picture = Picture.find(params[:id])
    if current_user.pictures.include? @picture
      @picture.destroy
      flash[:notice] = 'Picture deleted successfully'
    else
      flash[:notice] = 'Error: You cannot delete this picture as you did not create it'
    end
      redirect_to '/pictures'
  end

  def picture_params
    params.require(:picture).permit(:description, :image)
  end
end
