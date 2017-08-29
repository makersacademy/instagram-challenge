class CommentsController < ApplicationController
  def new
  end

  def create
    p comment_params
    @post = Post.find(params[:post_id])
    @comment = Comment.new(comment_params)
    @post.comments << @comment
    @post.save
    redirect_to root_path
  end

  private

  def comment_params
    params.require(:comment).permit(:message, :post_id, :user_id)
  end
end
