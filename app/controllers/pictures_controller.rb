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
    picture = Picture.find(params[:id])
    if picture.owner?(current_user)
      picture.destroy
      flash[:notice] = 'Picture deleted successfully'
    end
    redirect_to pictures_path
  end

  def edit
    @picture = Picture.find(params[:id])
  end

  def update
    picture = Picture.find(params[:id])
    if picture.owner?(current_user)
      picture.update(picture_params)
      flash[:notice] = 'Picture edited successfully'
    else
      flash[:notice] = 'You must be the ower to edit the picture'
    end
    redirect_to pictures_path
  end

  def picture_params
    params.require(:picture).permit(:caption, :name, :image)
  end

end
