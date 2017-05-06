class LikesController < ApplicationController

  def create
    @post = Post.find(params[:post_id])
    @post.likes.create
    redirect_to posts_path
  end
end
