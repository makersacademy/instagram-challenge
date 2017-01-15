class CommentsController < ApplicationController

  def new
    @post = Post.find(params[:post_id])
    @comment = Comment.new
  end

  def create
    user = current_user
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create_with_user(comment_params, user)
    redirect_to post_path(@post)
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    flash[:notice] = 'comment successfully deleted'
    redirect_to post_path(@post)
  end

  private

  def comment_params
    params.require(:comment).permit(:comments)
  end
end
