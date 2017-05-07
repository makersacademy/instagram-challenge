class CommentsController < ApplicationController
  def new
    @post = Post.find(params[:post_id])
    @comment = Comment.new
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.build_comment(comment_params, current_user)
    if @comment.save
      redirect_to posts_path
    else
      flash.keep[:alert] = "Error creating post. Please try again."
      redirect_to new_comment_path
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
