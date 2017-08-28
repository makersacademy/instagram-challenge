class LikesController < ApplicationController
  def new
    @like = Like.new
  end

  def create
    @like = Like.create(like_params)
    @post = @like.post
  end

  def destroy
    @like = Like.where(like_params)
    @like.destroy(@like.ids)
  end

  private

  def like_params
    params.require(:like).permit(:post_id, :user_id)
  end
end
