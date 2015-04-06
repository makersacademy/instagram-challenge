class CommentsController < ApplicationController

  def new
    @post = Post.find(params[:post_id])
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.post_id = params[:post_id]
    @comment.save
    redirect_to '/posts'
  end

  def comment_params
    params.require(:comment).permit(:comment)
  end

end
