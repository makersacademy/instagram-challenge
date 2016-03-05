class LikesController < ApplicationController

  def create
    @post = Post.find(params[:review_id])
    @post.likes.create
    redirect_to posts_path
  end

end
