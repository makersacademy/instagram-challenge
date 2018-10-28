# frozen_string_literal: true

class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    p comment_params
    @comment = Comment.create(comment_params)
    redirect_to messages_path
  end

  private

  def comment_params
    params.require(:comment).permit(:text, :user_id, :message_id)
  end
end
