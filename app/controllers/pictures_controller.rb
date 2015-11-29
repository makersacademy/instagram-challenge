class PicturesController < ApplicationController

	before_action :authenticate_user!, :except => [:index, :show]

	def index
		@pictures = Picture.all
	end

	def new
		@picture = Picture.new
	end

	def create
    Picture.create(pictures_params)
    redirect_to '/pictures'
  end

  def show
  	@picture = Picture.find(params[:id])
  end

  def edit
  	@picture = Picture.find(params[:id])
  end

  def update
  	@picture = Picture.find(params[:id])
    @picture.update(pictures_params)
    redirect_to '/pictures'
  end

  def destroy
  	@picture = Picture.find(params[:id])
  	@picture.destroy
  	flash[:notice] = 'Picture deleted successfully'
  	redirect_to '/pictures'
  end

  def pictures_params
    params.require(:picture).permit(:name, :description, :image)
  end

end
