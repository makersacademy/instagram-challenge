class ImagesController < ApplicationController

  before_action :authenticate_user!

  def index
    @images = Image.all
  end

  def new
    @image = Image.new
  end

  def create
    @image = Image.create(image_params)
    redirect_to '/images'
  end

  # def show
  #   @image = Image.find(params[:id])
  # end

  def edit
    @image = Image.find(params[:id])
    if !@image.belongs_to_user?(current_user)
      flash[:notice] = 'You can only edit your own pictures!'
      redirect_to '/images'
    end
  end

  def update
    @image = Image.find(params[:id])
    @image.update(image_params)
    redirect_to '/images'
  end

  def destroy
    @image = Image.find(params[:id])
    if @image.belongs_to_user?(current_user)
      @image.destroy
      flash[:notice] = 'Image deleted'
    else
      flash[:notice] = 'You can only delete your own pictures!'
    end
    redirect_to '/images'
  end

  private

  def image_params
    params.require(:image).permit(:image, :caption).merge(user: current_user)
  end
end
