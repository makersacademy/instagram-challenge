class LikesController < ApplicationController

  def create
    @post = Post.find(params[:post_id])
    Like.create(post_id: @post.id, user_id: current_user.id)
    redirect_to posts_path
  end

end
