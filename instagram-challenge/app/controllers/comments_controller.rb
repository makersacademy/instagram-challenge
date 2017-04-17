class CommentsController < ApplicationController
	def new
		@post = Post.find(params[:post_id])
		@comment = Comment.new
	end

	def create
		@post = Post.find(params[:post_id])
		@post.comments.create(params.require(:comment).permit(:comment))
		redirect_to '/posts'
	end
end
