class CommentsController < ApplicationController

  def new
    @post = Post.find(params[:post_id])
    @comment = Comment.new
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(comment_params)
    redirect_to '/posts'
  end

  private

  def comment_params
    params.require(:comment).permit(:thoughts, :rating)
  end
end
