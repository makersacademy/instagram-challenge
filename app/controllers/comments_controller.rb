class CommentsController < ApplicationController

	before_action :authenticate_user!

	def new
		@picture = Picture.find(params[:picture_id])
		@comment = Comment.new
	end

	def create
		@picture = Picture.find(params[:picture_id])
		@comment = @picture.comments.build_with_user(comment_params, current_user)
		@comment.save ? redirect_to(pictures_path) : render(:new)
	end

	private

	def comment_params
		params.require(:comment).permit(:thoughts)
	end

end
