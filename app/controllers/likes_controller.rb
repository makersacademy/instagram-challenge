class LikesController < ApplicationController

  def create
    @post = Post.find(params[:post_id])
    @post.likes.create(user: current_user)
    render json: {new_like_count: @post.likes.count}
  end

  def like_params
    params.require(:like).permit(:like).merge(user: current_user)
  end

end
