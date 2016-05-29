class PicturesController < ApplicationController
	def index
	end

	def new 
		@picture = Picture.new
	end

	def create
    @picture = Picture.create(picture_params)
    redirect_to @picture
  end

  def show
  	@picture = Picture.find(params[:id])
  end

  private

  def picture_params
    params.require(:picture).permit(:caption, :image)
  end
end
