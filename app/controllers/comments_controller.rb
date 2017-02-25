class CommentsController < ApplicationController

  def new
    @post = Post.find(params[:post_id])
    @comment = Comment.new
  end

  def create
    Comment.create(comment_params)
    redirect_to '/'
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :user_id, :post_id)
  end

end
