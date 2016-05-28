class PicturesController < ApplicationController
	
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
    	render 'new'
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

    redirect_to my_pictures_pictures_path
  end

  def destroy
    @picture = Picture.find(params[:id])
    @picture.destroy
    flash[:notice] = 'Picture deleted successfully'
    redirect_to my_pictures_pictures_path
  end

	def my_pictures
		# @pictures = Picture.all.where(user_id: current_user.id)
		@pictures = Picture.all
	end

  private

  def picture_params
    params.require(:picture).permit(:title)
  end
end
