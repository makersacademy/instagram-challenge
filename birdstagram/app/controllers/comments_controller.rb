class CommentsController < ApplicationController
  def create
    @comment = Comment.create(text: params[:comment], user_id: session[:user_id], post_id: params[:id])
    redirect_to '/posts'
  end
end
