class CommentsController < ApplicationController
  before_action :authenticate_user!

  def new
    @post = Post.find(params[:post_id])
    @comment = Comment.new
  end

  def create
    post = Post.find(params[:post_id])
    post.comments.create(comment_params)
    redirect_to posts_path
  end

  def destroy
    comment = Comment.find(params[:id])
    comment.destroy
    flash[:notice] = 'Comment deleted successfully'
    redirect_to posts_path
  end

  private

  def comment_params
    params.require(:comment).permit(:body).merge(user: current_user)
  end
end
