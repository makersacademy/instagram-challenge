class PicturesController < ApplicationController
	def index
    @pictures = Picture.all
	end

	def new 
		@picture = Picture.new
	end

	def create
    @picture = Picture.create(picture_params)
    if @picture.save
      flash[:success] = "Your picture has been created."
      redirect_to '/pictures'
    else
      flash[:alert] = "You need an image to post here!"
      render :new
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

    redirect_to '/pictures'
  end

  def destroy
    @picture = Picture.find(params[:id])
    @picture.destroy
    flash[:notice] = 'Picture deleted successfully'
    redirect_to '/pictures'
  end

  private

  def picture_params
    params.require(:picture).permit(:caption, :image)
  end
end
