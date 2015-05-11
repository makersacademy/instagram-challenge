class ImagesController < ApplicationController

  before_action :authenticate_user!, :except => [:index, :show]

  def index
    @images = Image.all
  end

  def new
  end

  def create
    @image = Image.new(image_params)
    @image.user_id = current_user.id
    if @image.save
      redirect_to images_path
    else
      render 'new'
    end
  end

  def show
    @image = Image.find(params[:id])
  end

  def edit
    @image = Image.find(params[:id])
    if @image.user_id == current_user.id
    else
      flash[:notice] = "Not your image"
    end
  end

  def update
    @image = Image.find(params[:id])
    @image.update(image_params)
    redirect_to images_path
  end

  def destroy
    @image = Image.find(params[:id])
    if @image.user_id == current_user.id
      @image.destroy
      flash[:notice] = 'Image deleted successfully'
    else
      flash[:notice] = "Not your image"
    end
    redirect_to images_path
  end

  def image_params
    params.require(:image).permit(:description, :image, :user_id)
  end
end
