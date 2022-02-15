class PostLikesController < ApplicationController
  def create
    PostLike.create(post_like_params)
    redirect_to root_path
  end

  def post_like_params
    params.require(:post).permit(:post_id)
  end
end
