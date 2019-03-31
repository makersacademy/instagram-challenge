class LikesController < ApplicationController

  def create
    Like.create(user_id: current_user.id, post_id: params[:post_id])
    redirect_to '/posts'
  end

  def destroy
    post = Post.find(params[:id]).likes.where(:user_id => current_user.id).destroy_all
    # post.likes.where(:user_id => current_user.id).destroy_all
    redirect_to '/posts'
  end
end
