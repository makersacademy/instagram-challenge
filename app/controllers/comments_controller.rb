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
    flash[:notice] = "Comment successfully added."
    redirect_to "/posts/#{@post.id}"
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
      flash[:notice] = "Comment successfully updated."
    else
      flash[:alert] = "You cannot update this comment."
    end
    redirect_to "/posts/#{params[:post_id]}/comments/#{params[:id]}"
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to "/posts/#{params[:post_id]}"
    flash[:notice] = "Comment successfully deleted!"
  end

  private

  def comment_params
    params.require(:comment).permit(:comment)
  end
end
