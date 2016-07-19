class CommentsController < ApplicationController

	def new
		@post = Post.find(params[:post_id])
		@comment = Comment.new
	end

	def create
		@post = Post.find(params[:post_id])
		@comment = Comment.create(comment_params)
		@comment.user_id = current_user.id
		@post.comments << @comment
		redirect_to '/posts'
	end

	private

	def comment_params
		params.require(:comment).permit(:comments)
	end
end
