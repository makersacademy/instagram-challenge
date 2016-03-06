class TagsController < ApplicationController
	def new
		@picture = Picture.find(params[:picture_id])
		@tag = Tag.new
	end

	def create
 	 	@picture = Picture.find(params[:picture_id])
  		@a = @picture.tags.create(tag_params)
  		p '--------'
  		p @a
  		p '---------'
  		redirect_to pictures_path
	end

	def tag_params
  		params.require(:tag).permit(:tag)
	end
end
