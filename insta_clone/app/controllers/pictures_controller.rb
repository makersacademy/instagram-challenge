class PicturesController < ApplicationController

  before_action :authenticate_user!, :except => :index

  before_action :require_permission, :only => :destroy

  def index
    @pictures = Picture.all
  end

  def new
    @picture = Picture.new
  end

  def create
    user = current_user
    @picture = user.pictures.create(picture_params)

    if @picture.save
      redirect_to '/pictures'
    else
      flash[:notice] = 'You must upload a picture'
      render :new
    end
  end

  def destroy
    @picture = Picture.find(params[:id])
    @picture.destroy
    flash[:notice] = 'Picture deleted successfully'
    redirect_to '/pictures'
  end

  def picture_params
    params.require(:picture).permit(:caption, :location, :image)
  end

  def require_permission
    if current_user != Picture.find(params[:id]).user
      flash[:notice] = 'You can not delete another user\'s picture'
      redirect_to root_path
    end
  end


end
