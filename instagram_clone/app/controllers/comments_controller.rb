class CommentsController < ApplicationController
  def new
    @post = Post.find(params[:post_id])
    @comment = Comment.new
  end

  def create
    @post = Post.find(params[:post_id])
    @post.comments.create(post_params)
    redirect_to '/posts'
  end

  def post_params
    params.require(:comment).permit(:thoughts)
  end
end
