class ImagesController < ApplicationController

  def index
  end

  def new
    @image = Image.new
  end

  def create
    @image = Image.new( image: image_params[:image],
                        description: image_params[:description])
                        
    @image.user = current_user
    if @image.save
      redirect_to '/images'
    else
      render 'new'
    end
  end

  def image_params
    params.require(:user).permit(:image, :description)
  end
end
