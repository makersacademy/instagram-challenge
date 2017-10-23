class ImagesController < ApplicationController

  before_action :authenticate_gramma!, :except => [:new]

  def new
  end

  def create
    @image = Image.new(image_params)
    @image.save
    redirect_to '/feed'
  end


  private
    def image_params
       params.require(:image).permit(:title, :location, :likes, :snappysnap)
    end
end
