class PicturesController < ApplicationController
  def index
    @pictures = Picture.all
  end

  def new
    @picture = Picture.new
  end

  def edit
    @picture = Picture.find(params[:id])
  end

  def show
    @picture = Picture.find(params[:id])
  end

  def create
    @picture = Picture.new(picture_params)
    if @picture.save
      redirect_to @picture
    else
      render 'new'
    end
  end

  def update
    @picture = Picture.find(params[:id])

    if @picture.update(article_params)
      redirect_to @picture
    else
      render 'edit'
    end
  end
  
private
  def picture_params
    params.require(:picture).permit(:title, :text)
  end
end
