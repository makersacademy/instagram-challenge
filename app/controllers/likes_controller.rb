class LikesController < ApplicationController

  def perform
    @post = Post.find(params[:post_id])
    post_check = @post.likes.where(user: current_user)
    if post_check.count > 0
      post_check.destroy_all
    else
      @post.likes.create(user: current_user)
    end
    render json: { new_like_count: @post.likes.count }
  end
end
