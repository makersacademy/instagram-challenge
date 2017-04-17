class ImagesController < ApplicationController

  before_action :authenticate_user!, :except => [:index]

  def index
    @images = Image.all.order("created_at DESC")
    @comment = Comment.new
  end

  def new
    @image = Image.new
  end

  def create
    @image = current_user.images.create(image_params)
    if @image.save
      redirect_to images_path
    else
      render 'new'
    end
  end

  def show
    @image = Image.find(params[:id])
  end

  def image_params
    params.require(:image).permit(:upload, :caption)
  end
end
