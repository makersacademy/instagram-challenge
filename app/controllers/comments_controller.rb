class CommentsController < ApplicationController
  def new
    @post = Post.find(params[:post_id])
    @comment = Comment.new
  end

  def create
    @post = Post.find(params[:post_id])
    @post.comments.create(comments_params)

    redirect_to posts_path
  end

  def comments_params
    params.require(:comment).permit(:text)
  end
end
