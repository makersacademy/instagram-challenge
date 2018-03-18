class PicturesController < ApplicationController

  before_action :authenticate_user!

  def index
    @pictures = Picture.all
  end

  def show
    @picture = Picture.find(params[:id])
  end

  def new
    @picture = Picture.new
  end

  def create
    @picture = Picture.new(picture_params)

    if @picture.save
      redirect_to @picture
    else
      render 'new'
    end

  end

  private
    def picture_params
      params.require(:picture).permit(:url, :comment)
    end
end
