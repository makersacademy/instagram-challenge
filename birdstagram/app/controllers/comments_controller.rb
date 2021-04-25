class CommentsController < ApplicationController

  def create
    @comment = Comment.create(text: params[:comment], user_id: session[:user_id], post_id: params[:id])
    redirect_to '/posts'
  end

  def load_comments(post_id)
    @comments = Comment.where(post_id: post_id).pluck(:text, :user_id)
  end

end
