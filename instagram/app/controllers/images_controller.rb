class ImagesController < ApplicationController

  def index 

  end 

  def new 
    @image = Image.new
  end 

  def create 
    @image = Image.new(pic_params)
  end 

  private 

  def pic_params 
    params.require(:image).permit(:title, :description)
  end 

end
