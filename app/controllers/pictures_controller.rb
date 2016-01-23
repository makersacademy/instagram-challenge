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
      redirect_to pictures_path
    else
      render 'new'
    end
  end

  def show
    @picture = Picture.find(params[:id])
  end

  def edit
    @picture = Picture.find(params[:id])
  end

  def update
    @picture = Picture.find(params[:id])
    @picture.update(picture_params)
    redirect_to "/pictures/#{@picture.id}"
  end

  def destroy
    @picture = Picture.find(params[:id])
    @picture.delete
    flash[:notice] = "Picture deleted"
    redirect_to pictures_path
  end

  private

  def picture_params
    params.require(:picture).permit(:title, :caption, :image)
  end
end
