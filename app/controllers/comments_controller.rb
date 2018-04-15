class CommentsController < ApplicationController
  before_action :find_post

  def create
    @comment = @post.comments.create(comment_params)
  end

  private

  def find_post
    @post = Post.find(params[:post_id])
  end

  def comment_params
    params(:comment).permit(:content)
  end
end
