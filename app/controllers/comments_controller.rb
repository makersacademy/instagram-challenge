# frozen_string_literal: true

# Controller for the comments
class CommentsController < ApplicationController
  before_action :find_post
  include CommentsHelper

  def create
    @post.comments.create(user_id: current_user.id,
                          comment_text: params[:comment].values.join(''))
    redirect_to post_url(@post)
  end

  def show; end

  private

  def find_post
    @post = Post.find(params[:post_id])
  end
end
