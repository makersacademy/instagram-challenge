class ImagesController < ApplicationController

  before_action :authenticate_user!, :except => [:index, :show]

  def index
    @images = Image.last(50)
  end

  def new
    @image = current_user.images.new
  end

  def create
    @image = current_user.images.new(image_params)
    if @image.save
      redirect_to images_path
    else
      flash[:error] = @image.errors.full_messages
      render 'new'
    end
  end

  private

  def image_params
    params.require(:image).permit(:title, :description, :image_file)
  end
end
