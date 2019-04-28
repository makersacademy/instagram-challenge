class PicsController < ApplicationController
  def index
    @pics = Pic.all
  end

  def new
    @pic = Pic.new
  end

  def create
    pic = Pic.create(pic_params)
    if pic.save
      redirect_to feed_path
    else
      render 'new'
    end
  end

  private
  
  def pic_params
    params.require(:pic).permit(:image)
  end
end
