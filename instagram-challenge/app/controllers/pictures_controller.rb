class PicturesController < ApplicationController

  before_action :authenticate_user!, :except => [:index, :show]

  def index
    @pictures = Picture.all
  end
  def new
    @picture = Picture.new
  end
  def create
    @picture = Picture.create(picture_params)
    @picture.user = current_user
    if @picture.save
      redirect_to pictures_path
    else
      render 'new'
    end
  end
  def show
    @picture = Picture.find(params[:id])
  end
  def destroy
    @picture = Picture.find(params[:id])
    if @picture.user == current_user
      @picture.destroy
      flash[:notice] = 'Picture deleted successfully'
      redirect_to pictures_path
    else
      flash[:notice] = "Not your picture"
      redirect_to '/pictures'
  end
end

  private
  def picture_params
    params.require(:picture).permit(:image, :description)
  end
end
