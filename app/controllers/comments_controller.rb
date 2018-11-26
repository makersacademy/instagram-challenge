# frozen_string_literal: true

class CommentsController < ApplicationController
  before_action :authenticate_user!

  include ApplicationHelper::Likeable.new Comment
  include ApplicationHelper::Commentable.new Comment

  def create
    @comment = Comment.create(comment_params)
  end

  private

  def comment_params
    params.require(:comment).permit(:message).merge(user: current_user)
  end
end
