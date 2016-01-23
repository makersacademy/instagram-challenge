class PicturesController < ApplicationController
  def index
    @pictures = Picture.all
  end

  def create
    @picture = Picture.new(picture_params)
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

  def picture_params
    params.require(:picture).permit(:description, :image)
  end
end
