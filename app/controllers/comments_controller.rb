class CommentsController < ApplicationController

  before_action :authenticate_user!, :except => [:index]

  def new
    @post = Post.find(params[:post_id])
    @comment = Comment.new
  end

  def create
    @post = Post.find(params[:post_id])
    @post.comments.create(comment_params)
    flash[:notice] = 'Comment Added'
    redirect_to posts_path
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    flash[:notice] = 'Comment deleted successfully'
    redirect_to posts_path
  end

  def comment_params
    params.require(:comment).permit(:text)
  end
end