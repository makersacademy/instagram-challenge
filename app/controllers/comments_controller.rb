# frozen_string_literal: true

class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]
  before_action :find_post!

  def index
    @comments = @post.comments.order(created_at: :desc)
  end

  def new
    @comment = Comment.new
  end

  def create
    post_id = params[:post_id]
    @post = Post.find(post_id)
    @comment = @post.comments.create(comment_params.merge(user_id: current_user.id, post_id: post_id))
    redirect_to welcome_index_url
  end

  private

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def find_post!
    post_id = params[:post_id]
    @post = Post.find(post_id)
  end

  def comment_params
    params.require(:comment).permit(:body, :post_id, :user_id)
  end
end
