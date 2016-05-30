class CommentsController < ApplicationController

  before_action :authenticate_user!

  def new
    @post = Post.find(params[:post_id])
    @comment = Comment.new
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.build_comment_with_user(comment_params, current_user)
    redirect_to posts_path if @comment.save
  end

  private

  def comment_params
    params.require(:comment).permit(:comment)
  end

end
