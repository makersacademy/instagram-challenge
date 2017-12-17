class PicturesController < ApplicationController
skip_before_action :verify_authenticity_token
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
      render :new
    end
  end

  def show
    @picture = Picture.find(params[:id])
    @comments = @picture.comments
  end

  private

  def picture_params
    params.require(:picture).permit(:description, :image)
  end

end
