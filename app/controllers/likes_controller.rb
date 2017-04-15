class LikesController < ApplicationController

  def create
    @post = Post.find(params[:post_id])
    @like = @post.likes.create
    current_user.likes << @like
    render json: {new_like_count: @post.likes.count}
  end

end
