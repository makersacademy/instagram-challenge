class PicturesController < ApplicationController
  def index
    @pictures = Picture.all.reverse
  end

  def new
    @picture = Picture.new
  end

  def create
    @picture = Picture.create(post_params)
    if @picture.save
      flash[:success] = "Picture post created!"
      # redirect_to pictures_path
      redirect_to @picture
    else
      flash[:alert] = "You didn't upload anything!"
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
