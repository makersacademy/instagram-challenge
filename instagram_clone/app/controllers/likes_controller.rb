class LikesController < ApplicationController
  def new
  end
  
  def create
    @post = Post.find(params[:review_id])
    @post.likes.create
    redirect_to post_path
  end
end
