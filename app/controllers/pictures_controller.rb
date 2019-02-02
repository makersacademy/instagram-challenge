class PicturesController < ApplicationController
  def index
  end 
  
  #associated with the view file new.html.haml
  def new
    @picture = Picture.new
 end 

  #no view file - responsible for creating the component of a picture in the db
  def create
    @picture = Picture.create(pic_params)
  end 

  private 
  def pic_params
    params.require(:picture).permit(:title, :description)
  end
end
