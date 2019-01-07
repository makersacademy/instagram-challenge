class CommentsController < ApplicationController

  def edit
    @post = Post.find(params[:id])
    @comment = @post.comments.find(params[:post_id])
  end

  def update
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    @comment.update(comment_params)
    redirect_to post_path(@post)
  end

  def new
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(params[:comment].permit(:created_by, :comment))
    redirect_to post_path(@post)
  end

  def destroy
    @post = Post.find(params[:id])
    @comment = @post.comments.find(params[:post_id])
    @comment.destroy
    redirect_to post_path(@post)
  end
  private

  def comment_params
    params.require(:comment).permit(:created_by, :comment)
  end

end
