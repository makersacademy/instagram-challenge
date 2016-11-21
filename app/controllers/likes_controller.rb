class LikesController < ApplicationController

  def create
    @post = Post.find(params[:post_id])
    @post.likes.create(user: current_user)
    redirect_to posts_path
  end

  def like_params
    params.require(:like).permit(:like).merge(user: current_user)
  end
end
