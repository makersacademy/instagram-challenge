class PhotosController < ApplicationController
	before_action :authenticate_user!, :except => [:index, :show]

	def index
		@photos  = Photo.all
		@comment = Comment.new
		@like    = Like.new
		@photo   = Photo.new
	end

	def show
  	@photo = Photo.find(params[:id])
	end

	def new
		@photo = Photo.new
	end

	# def create
	# 	Photo.create(photo_params)
	# 	redirect_to '/photos'
	# end

	def create
    @photo = current_user.photos.new(photo_params)
    if @photo.save
      redirect_to photos_path
    else
      render 'new'
    end
  end

	# def destroy
	# 	@photo = Photo.find(params[:id])
	# 	@photo.destroy
	# 	flash[:notice] = "Photo deleted successfully"
	# 	redirect_to "/photos"
	# end

	def destroy
    @photo = Photo.find(params[:id])
    if @photo.user_id == current_user.id
      @photo.destroy
      flash[:notice] = 'Picture deleted'
      redirect_to '/photos'
    else
      flash[:notice] = 'You may not delete this'
      redirect_to '/photos'
    end
  end

  private

  #utility method
  def photo_params
  	params.require(:photo).permit(:description, :picture, :image)
  end

end
