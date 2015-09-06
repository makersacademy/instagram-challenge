class CommentsController < ApplicationController
	def new 
		@post = Post.find(params[:post_id])
		@comment = Comment.new
	end 

	def create
		@post = Post.find(params[:post_id])
		@comment = @post.comments.create(comment_params)
		@comment.save!
		redirect_to posts_path
	end

	# def destroy 
	# 	@post = Post.find(params[:post_id])
	# 	@comment.destroy
	# 	flash[:notice] = 'Comment deleted successfully'
	# 	params.delete(:id)
	# 	redirect_to posts_path
	# end 

	def comment_params
		params.require(:comment).permit(:thoughts)
	end 
end
