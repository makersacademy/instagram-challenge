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
    if current_user != nil && current_user.id == picture.user_id
      picture.destroy
      flash[:notice] = 'Picture deleted successfully'
    end
    redirect_to pictures_path
  end

  def picture_params
    params.require(:picture).permit(:caption, :name, :image)
  end

end
