class CommentsController < ApplicationController

  def new
    @post = Post.find(params[:post_id])
    @comment = Comment.new
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(review_params)
    @comment.user = current_user
    @comment.save
    redirect_to posts_path
  end

  private

  def review_params
    params.require(:comment).permit(:thoughts)
  end
end
