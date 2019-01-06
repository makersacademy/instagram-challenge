# frozen_string_literal: true

class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(comment_params.merge(user_id: current_user.id))
    flash[:success] = "Comment added!"
    redirect_to post_path(@post)
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    flash[:success] = "Comment deleted!"
    redirect_to post_path(@post)
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end
end
