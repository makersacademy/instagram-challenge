class CommentsController < ApplicationController

  before_action :set_post

  def create
    @comment = @post.comments.create(comment_params)
    # @comment.save
    redirect_to posts_url
  end

  private
  def comment_params
  params.require(:comment).permit(:body)
  end

  def set_post
    @post = Post.find(params[:post_id])
  end
end
