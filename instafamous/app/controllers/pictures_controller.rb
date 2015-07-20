class PicturesController < ApplicationController
  def index
    @pictures = Picture.all
    @comment = Comment.new
  end

  def new
    @picture = Picture.new
  end

  def create
    @picture = current_user.pictures.create(picture_params)
    if @picture.save
       redirect_to('/pictures')
    else
       render 'new'
    end
  end

  def picture_params
    params.require(:picture).permit(:caption, :image)
  end
end
