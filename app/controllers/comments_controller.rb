# frozen_string_literal: true

class CommentsController < ApplicationController
  before_action :find_post, only: [:create, :destroy]
  def create
    @comment = @post.comments.create(comment_params.merge(post_id: @post.id, user_id: current_user.id))
    flash[:success] = "Comment added!"
    redirect_to post_path(@post)
  end

  def destroy
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    flash[:success] = "Comment deleted!"
    redirect_to post_path(@post)
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end

  def find_post
    @post = Post.find(params[:post_id])
  end
end
