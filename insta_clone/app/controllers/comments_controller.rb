class CommentsController < ApplicationController
  def new
    @post = Post.find(params[:post_id])
    @comment = Comment.new
  end

  def create
  @post = Post.find(params[:post_id])
  @post.comments.create(comments_params)
  redirect_to '/posts'
  end

  def destroy
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    flash[:notice] = "Comment deleted :("
    redirect_to root_path
  end

  private

  def comments_params
    params.require(:comment).permit(:comment)
  end
end
