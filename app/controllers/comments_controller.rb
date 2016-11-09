class CommentsController < ApplicationController
include CommentsHelper

  def new
    @post = Post.find(params[:post_id])
    @comment = Comment.new
  end

  def create
    find_post_and_build_with_user
    try_save_comment_and_flash
    redirect_to posts_path
  end

  private

  def comment_params
    params.require(:comment).permit(:name, :body)
  end

end
