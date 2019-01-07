class LikesController < ApplicationController

  def new
  end

  def create
    @post = Post.find(params[:post_id])
    likes = {user_id: current_user.id, post_id: params[:post_id]}
    @like = Like.create(likes)
    redirect_back(fallback_location: root_path)
  end

  def destroy
    @post = Post.find(params[:post_id])
    like = Like.find_by(user_id: current_user.id, post_id: params[:post_id])
    like.destroy
    redirect_back(fallback_location: root_path)
  end
end
