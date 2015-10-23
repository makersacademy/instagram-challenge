class PicturesController < ApplicationController

  before_action :authenticate_user!

  def index
    @pictures = Picture.all.order('created_at DESC')
  end

  def new
    @picture = Picture.new
  end

  def create
    picture = Picture.new(picture_params.merge(user_id: current_user.id))
    if picture.save
      redirect_to pictures_path
    else
      render 'new'
    end
  end

  def destroy
    picture = Picture.find(params[:id])
    if picture.destroy_as current_user
      flash[:notice] = 'Picture deleted successfully'
    else
      flash[:alert] = picture.errors
    end
    redirect_to pictures_path
  end

  def picture_params
    params.require(:picture).permit(:image)
  end

end

