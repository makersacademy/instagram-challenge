class PicturesController < ApplicationController

  def new
    @picture = Picture.new
  end

  def index
    @pictures = Picture.all
  end

  def create
    @picture = Picture.new(picture_params)
    if @picture.save
      redirect_to 'index', notice: 'Picture was successfully uploaded.'
     else
       render action: 'new'
    end
  end

  private

  def picture_params
    params.require(:picture).permit(:image)
  end

end
