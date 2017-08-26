class LikesController < ApplicationController
  def new
    @like = Like.new
  end

  def create
    @like = Like.create(like_params)
    @post = @like.post
    redirect_to posts_url
  end

  private

  def like_params
    params.require(:like).permit(:post_id, :user_id)
  end
end
