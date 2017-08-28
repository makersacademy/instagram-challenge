class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.create(like_params)
    @post = @comment.post
    redirect_to posts_url
  end

  private

  def like_params
    params.require(:comment).permit(:post_id, :user_id, :body)
  end
end
