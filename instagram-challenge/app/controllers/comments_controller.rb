class CommentsController < ApplicationController

  def new
    @post = Post.find(params[:post_id])
    @comment = Comment.new
  end

  def create
    @post = Post.find(params[:post_id])
    comment = @post.comments.create_with_user(permitted_comments_params, current_user)
    redirect_to root_path
  end

  private

  def permitted_comments_params
    params.require(:comment).permit(:comment)
  end

end
