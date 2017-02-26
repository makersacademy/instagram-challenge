class LikesController < ApplicationController

  def create
    @posts = Post.find(params[:post_id])
    @posts.likes.create
    likes_count = @posts.likes.count
    render json: {new_likes_count: @posts.likes.count}
  end
end
