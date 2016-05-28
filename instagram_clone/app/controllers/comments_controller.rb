class CommentsController < ApplicationController

	include CommentsHelper

	before_action :authenticate_user!
	before_action :check_comment_belongs_to_user, only: [:destroy]

	def create
		post = Post.find(params[:post_id])
		post.comments.create_with_user(comment_params,current_user)
		redirect_to post_path(post)
	end

	def destroy
		comment = Comment.find(params[:id])
		comment.destroy
		redirect_to post_path(comment.post)
	end

	def comment_params
		params.require(:comment).permit(:comment)
	end

end
