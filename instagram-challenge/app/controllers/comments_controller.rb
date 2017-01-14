class CommentsController < ApplicationController

  def new
    @post = Post.find(params[:post_id])
    @comment = Comment.new
  end

  def create
    @post = Post.find(params[:post_id])
    @post.comments.create(permitted_comments_params)
    redirect_to root_path
  end

  private

  def permitted_comments_params
    params.require(:comment).permit(:comment)
  end

end
