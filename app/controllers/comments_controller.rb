# frozen_string_literal: true

class CommentsController < ApplicationController
  before_action :authenticate_user!
  # signed out user can see all comments of post, but need to sign in to post comment

  def new
    # p 'hello'
    @comment = Comment.new
    @post = Post.find(params[:post_id])
  end

  def create
    # p params
    @comment = Comment.new(comment_from_params)
    @comment.user_id = current_user.id
    @comment.post_id = params[:post_id]
    if @comment.save
      flash[:alert] = 'comment saved'
      redirect_to post_path(@comment.post)
    else
      render :new, error: 'comment not posted'
    end
  end

private
  def comment_from_params
    params.require(:comment).permit(:body)
  end
end
