class LikesController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @post.likes.create
    # @post.update_rating
    redirect_to post_path(@post.id)
  end
end
