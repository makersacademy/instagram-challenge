class TagsController < ApplicationController
	before_action :authenticate_user!, :except => [:index, :show]
	def new
		@picture = Picture.find(params[:picture_id])
		@tag = Tag.new
	end

	def create
 	 	@picture = Picture.find(params[:picture_id])
  		@a = @picture.tags.create(tag_params)
  		redirect_to pictures_path
	end

	def tag_params
  		params.require(:tag).permit(:tag)
	end
end
