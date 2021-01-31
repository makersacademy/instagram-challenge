class PicturesController < ApplicationController
  def index
    @pictures = Picture.all.order("created_at DESC")
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
      redirect_to '/pictures'
    else
      render :new
    end
  end

  private
    def picture_params
      params.require(:picture).permit(:url, :user_id)
    end
end
