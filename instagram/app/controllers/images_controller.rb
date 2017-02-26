class ImagesController < ApplicationController
  # before_action :authenticate_user!, :except => [:index, :show]

  def index
    @images = Image.all
  end

  def new
    @image = Image.new
  end

  def create
    @user = current_user
    @image = @user.images.new(image_params)
    if @image.save
      redirect_to images_path
    else
      render 'new'
    end
  end

  def show
    @user = current_user
    @image = Image.find(params[:id])
  end

  def edit
    @image = Image.find(params[:id])
  end

  def update
    @image = Image.find(params[:id])
    @image.update(image_caption)
    redirect_to images_path
  end

  def destroy
    @image = Image.find(params[:id])
    @image.destroy
    flash[:notice] = 'Image deleted successfully'
    redirect_to images_path
  end

  private

  def image_params
    params.require(:image).permit(:caption, :image)
  end

  def image_caption
    params.require(:image).permit(:caption)
  end

end
