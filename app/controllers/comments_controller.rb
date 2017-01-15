class CommentsController < ApplicationController

  before_action :authenticate_user!

  def new
    @post = Post.find(params[:post_id])
    @comment = Comment.new
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(comment_params)
    if @comment.save
      flash[:notice] = "Your comment was saved."
    else
      flash[:alert] = "Your comment could not be saved"
    end
    redirect_to @post
  end

  private

  def comment_params
    params.require(:comment).permit(:text, :post_id)
  end
end
