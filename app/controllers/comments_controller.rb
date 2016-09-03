class CommentsController < ApplicationController

  before_action :authenticate_user!

  def new
    @post = Post.find(params[:post_id])
    @comment = Comment.new
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(comment_params)
    @comment.user = current_user
    if @comment.save
      render "posts/show"
    else
      render "new"
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:comment)
  end

end
