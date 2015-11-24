class ImagesController < ApplicationController

  before_action :authenticate_user!, :except => [:index, :show]

  def index
    @images = Image.all
  end

  def new
    @image = Image.new
  end

  def create
   @image = current_user.images.new(image_params)
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
    if current_user == @image.user
      render 'edit'
    else
      flash[:notice] = "You can not edit someone else's image"
      redirect_to '/images'
    end
  end

  def update
    @image = Image.find(params[:id])
    @image.update(image_params)
    redirect_to images_path
  end

  def destroy
    @image = Image.find(params[:id])
    if current_user == @image.user
      @image.destroy
      flash[:notice] = 'Image deleted successfully'
      redirect_to '/images'
    else
      flash[:notice] = 'You can not delete an image that you have not uploaded'
      redirect_to '/images'
    end
  end

  def image_params
    params.require(:image).permit(:name, :image)
  end
end
