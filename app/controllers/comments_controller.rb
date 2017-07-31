class CommentsController < ApplicationController
  def new
    @post = Post.find(params[:post_id])
  end

  def create
    post = Post.find(params[:post_id])
    post.comments.create(comments_params)
    redirect_to user_path(post.user_id)
  end

  private
  def comments_params
    params.require(:comment).permit(:message, :post_id)
  end
end
