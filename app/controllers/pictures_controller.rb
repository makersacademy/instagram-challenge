class PicturesController < ApplicationController
  def index
    @pictures = Picture.all
  end

  def new
    @picture = Picture.new
  end

  def create
    @picture = Picture.new(picture_params)
    if @picture.save
      redirect_to root_path :flash => { :notice => "New picture posted" }
    else
      render :new
    end
  end

  def show
  end
  
  private

  def picture_params
    params.require(:picture).permit(:caption) # wow. this was it. solved by going back to the blog.
  end
  

end
