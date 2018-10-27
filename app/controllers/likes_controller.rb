class LikesController < ApplicationController
  before_action :set_post

  def create
    @post.likes.create
    redirect_to posts_url
  end

  private
  def set_post
    @post = Post.find(params[:post_id])
  end
end
