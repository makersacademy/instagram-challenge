class LikesController < ApplicationController
  before_action :authenticate_user!

  def create
    @post = Post.find(params[:post_id])
    @like = @post.likes.new(user: current_user)
    unless @like.save
      @like = Like.find_by(user: current_user, post: @post)
      @like.destroy
    end
    render json: { new_like_count: @post.likes.count }
  end
end
