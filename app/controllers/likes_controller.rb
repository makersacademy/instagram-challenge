# frozen_string_literal: true

class LikesController < ApplicationController
  before_action :find_post

  def create
    @post.likes.create(user_id: current_user.id)
    redirect_to welcome_index_url
  end

  def destroy
    @like = @post.likes.find(params[:id])
    @like.destroy
    redirect_to welcome_index_url
  end

  private
  def find_post
    @post = Post.find(params[:post_id])
  end
end
