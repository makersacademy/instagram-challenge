class LikesController < ApplicationController
  def new
    @post = Post.find(params[:post_id])
    @like = Like.new
  end
  def create
    @post = Post.find(params[:post_id])
    @post.likes.create
    redirect_to posts_path
  end
end
