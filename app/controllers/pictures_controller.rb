class PicturesController < ApplicationController
  def index
    @pictures = Picture.all
  end

  def create
    if params[:image].nil?
      flash[:error] = "Please select a file"
    else
      @picture = Picture.new(picture_params)
      @picture.save
      redirect_to pictures_path
    end
  end

  def show
    @picture = Picture.find(params[:id])
  end

  def destroy
    @picture = Picture.find(params[:id])
    @picture.destroy

    redirect_to pictures_path
  end

  private
    def picture_params
      params.require(:picture).permit(:image)
    end
end
