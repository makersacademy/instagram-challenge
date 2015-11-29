class CommentsController < ApplicationController

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.save
    redirect_to root_path
  end

  def comment_params
    params.require(:comment).permit(:comment)
  end

end
