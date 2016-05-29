class PicturesController < ApplicationController
	def index
	end

	def new 
		@picture = Picture.new
	end

	def create
    @picture = Picture.create(picture_params)
    if @picture.save
      flash[:success] = "Your picture has been created."
      redirect_to @picture
    else
      flash[:alert] = "You need an image to post here!"
      render :new
    end
  end

  def show
  	@picture = Picture.find(params[:id])
  end

  private

  def picture_params
    params.require(:picture).permit(:caption, :image)
  end
end
