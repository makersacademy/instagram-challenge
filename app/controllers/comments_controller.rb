class CommentsController < ApplicationController
  include CommentsHelper

  before_action :authenticate_user!, :except => [:show]

  def new
    @post = Post.find(params[:post_id])
    @comment = Comment.new
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(comment_params)
    @comment.user = current_user
    @comment.save
    redirect_to post_path(@post), notice: "Comment successfully added."
  end

  def show
    @post = Post.find(params[:post_id])
    @comment = Comment.find(params[:id])
  end

  def edit
    @post = Post.find(params[:post_id])
    @comment = Comment.find(params[:id])
  end

  def update
    @post = Post.find(params[:post_id])
    @comment = Comment.find(params[:id])
    if (current_user.id == @comment.user_id)
      @comment.update(comment_params)
      redirect_to post_comment_path(@post, @comment), notice: "Comment successfully updated."
    else
      redirect_to post_comment_path(@post, @comment), alert: "You cannot update this comment."
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = Comment.find(params[:id])

    if (current_user.id == @comment.user_id)
      @comment.destroy
      redirect_to post_path(@post), notice: "Comment successfully deleted!"
    else
      redirect_to post_comment_path(@post, @comment), alert: "You cannot delete this comment."
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:comment)
  end
end
