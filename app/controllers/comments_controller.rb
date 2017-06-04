class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.create(comment_params)
    redirect_to posts_url
  end

  private

  def comment_params
    params.require(:comment).permit(:comment, :post_id, :user_id)
  end

end
