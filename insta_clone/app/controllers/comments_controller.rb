class CommentsController < ApplicationController
  def new
    @post = Post.find(params[:post_id])
    @comment = Comment.new
  end

  def create
  @post = Post.find(params[:post_id])
  @post.comments.create(comments_params)
  redirect_to '/posts'
  end

  private

  def comments_params
    params.require(:comment).permit(:comment)
  end
end
