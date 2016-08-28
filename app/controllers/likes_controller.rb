class LikesController < ApplicationController

  def create
    @post = Post.find(params[:post_id])
    @post.likes.create_with_user({}, current_user)
    render json: { new_likes_count: @post.likes.count }
  end
end
