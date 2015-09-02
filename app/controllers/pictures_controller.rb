class PicturesController < ApplicationController

  before_action :authenticate_user!, :except => [:index, :show]

  def index
    @pictures = Picture.all
  end

  def new
    @picture = Picture.new
  end

  def create
    picture = Picture.create(picture_params)
    if picture.save
      redirect_to pictures_path
    else
      render 'new'
    end
  end

  def picture_params
    params.require(:picture).permit(:description, :picture)
  end

  def show
    @picture = Picture.find(params[:id])
    @user = current_user
  end

  def edit
    @picture = Picture.find(params[:id])
  end

  def update
    picture = Picture.find(params[:id])
    if picture.update_as(current_user, picture_params)
      redirect_to picture_path
    else
      flash[:alert] = picture.errors
      redirect_to picture_path
    end
  end

  def destroy
    picture = Picture.find(params[:id])
    if picture.destroy_as current_user
      flash[:notice] = 'Picture deleted successfully'
      redirect_to pictures_path
    else
      flash[:alert] = picture.errors
      redirect_to picture_path
    end
  end
end
