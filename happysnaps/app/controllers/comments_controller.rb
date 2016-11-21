class CommentsController < ApplicationController
  before_action :set_post

  def create
    @post.comments.build(comment_params)
    # @comment.user_id = current_user.id
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end

  def set_post
  @post = Post.find(params[:post_id])
  end

end
