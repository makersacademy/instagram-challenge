class PicturesController < ApplicationController

  before_action :authenticate_user!, :except => [:index, :show]
  before_action :require_permission, :only => [:destroy]

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
      render :new
    end
  end

  def show
    @picture = Picture.find(params[:id])
  end

  def destroy
    @picture = Picture.find(params[:id])
    @picture.destroy
    flash[:notice] = 'Picture deleted successfully'
    redirect_to '/pictures'
  end

  private

  def picture_params
    params.require(:picture).permit(:title, :url)
  end

  def require_permission
    if current_user.id != Picture.find(params[:id]).user_id
      redirect_to '/'
    end
  end
end
