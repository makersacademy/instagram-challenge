class CommentsController < ApplicationController

	def new
		@picture = Picture.find(params[:picture_id])
		@comment = Comment.new
	end

	def create
		@user = current_user
		@picture = Picture.find(params[:picture_id])
		comment = @picture.comments.create(comment_params)
		@user.comments << comment
		@user.save
		redirect_to "/pictures/#{@picture.id}"
	end

	private

		def comment_params
			params.require(:comment).permit(:thoughts)
		end

end