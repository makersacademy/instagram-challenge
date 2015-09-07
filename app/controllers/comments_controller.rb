class CommentsController < ApplicationController
  include CommentsHelper

  def create
   @post = Post.find(params[:post_id])
   @comment = @post.comments.create_with_user(comment_params, current_user)
   redirect_to post_path(params[:post_id])
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id]).destroy
    redirect_to post_path(params[:post_id])
  end

  def show

  end
end
