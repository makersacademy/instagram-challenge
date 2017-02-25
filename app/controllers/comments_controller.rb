class CommentsController < ApplicationController
  def new
    @posts = Post.find(params[:post_id])
    @comments = Comment.new
  end

  def create
    @posts = Post.find(params[:post_id])
    @posts.comments.create(comment_params)
    redirect_to '/posts'
  end

  private

  def comment_params
    params.require(:comment).permit(:comment)
  end
end
