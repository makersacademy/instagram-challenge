class CommentsController < ApplicationController

	before_action :comment_creator?, :only => [:edit, :update, :destroy]

	def new 
		@post = Post.find(params[:post_id])
		@comment = Comment.new 
	end

	def create
		@post = Post.find(params[:post_id])
		@comment = @post.comments.create(comment_params)
		@comment.user_id = current_user.id
		if @comment.save
			redirect_to posts_path
		else
			render 'new'
		end
	end

	def edit
		@post = Post.find(params[:post_id])
		@comment = Comment.find(params[:id])
	end

	def update
    @comment = Comment.find(params[:id])
    if @comment.update(comment_params)
      redirect_to '/posts'
    else
      render 'edit'
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
  	flash[:notice] = 'Comment deleted successfully'
  	redirect_to '/posts'
  end

  def comment_creator?
    @comment = Comment.find(params[:id])
    unless current_user.id == @comment.user_id
      flash[:notice] = "You didn't post this"
      redirect_to posts_path
    end
  end

	private

		def comment_params
			params.require(:comment).permit(:message)
		end
end




