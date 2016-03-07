class ImagesController < ApplicationController

  before_action :authenticate_user!, except: [:index, :show]

  def index
    @images = Image.all
  end

  def show
    @image = Image.find(params[:id])
    @comment = Comment.new
  end

  def new
    @image = Image.new
  end

  def create
    @image = Image.new(image_params)

    @image.user = current_user
    if @image.save
      redirect_to '/images'
    else
      flash[:notice] = 'Incorrect attachment'
      render 'new'
    end
  end

  def image_params
    params.require(:image).permit(:image, :description)
  end
end
