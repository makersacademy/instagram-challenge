class CommentsController < ApplicationController
  before_action :set_post

  def create
    @comment = Comment.create(comment_params)
    @comment.user_id = current_user.id
    redirect_to posts_url
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :post_id, :user_id)
  end

  def set_post
    @post = Post.find(params[:post_id])
  end
end
