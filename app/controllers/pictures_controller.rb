class PicturesController < ApplicationController
  def index
    @pictures = Picture.all
  end

  def new
    @picture = Picture.new
  end

  def create
    @picture = Picture.create(post_params)
    if @picture.save
      flash[:success] = "Picture post created."
      redirect_to pictures_path
    else
      flash[:alert] = "Halt, you fiend! You need an image to post here!"
      render :new
    end
  end

  def show
    @picture = Picture.find(params[:id])
  end

  private

  def post_params
    params.require(:picture).permit(:caption, :image)
  end
end
