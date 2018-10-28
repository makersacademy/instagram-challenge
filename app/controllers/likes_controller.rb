# frozen_string_literal: true

# Controller for Likes - Manages creation and destruction of likes
class LikesController < ApplicationController
  before_action :find_posts
  before_action :find_like, only: [:destroy]

  def create
    @post.likes.create(user_id: current_user.id) unless already_liked?

    redirect_to posts_url
  end

  def destroy
    @like.destroy if already_liked?

    redirect_to posts_url
  end

  private

  def already_liked?
    Like.where(user_id: current_user.id, post_id: params[:post_id]).exists?
  end

  def find_like
    @like = @post.likes.find(params[:id])
  end

  def find_posts
    @post = Post.find(params[:post_id])
  end
end
