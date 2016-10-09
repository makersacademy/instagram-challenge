class CommentsController < ApplicationController
  def new
    @post = Post.find(params[:post_id])
    @comment = Comment.new
  end
  def create
    @post = Post.find(params[:post_id])
    @comment = Comment.new(comment_params)
    @comment.post_id = params[:post_id]
    if @comment.save
      redirect_to '/posts'
    else
      if @comment.errors
        # Note: if you have correctly disabled the review button where appropriate,
        # this should never happen...
        redirect_to '/posts', alert: 'An error occured'
      else
        redirect_to '/posts'
      end
    end
  end

private
  def comment_params
    params.require(:comment).permit(:content)
  end

end
