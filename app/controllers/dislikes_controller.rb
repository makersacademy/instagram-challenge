class DislikesController < ApplicationController
  before_action :authenticate_user!

  def create
    @post = Post.find(params[:post_id])
    if !@post.dislikes_for?(current_user)
      @post.dislikes.create(user: current_user)
    end
    @post.likes_for(current_user).destroy_all
    @post.update_rating
    redirect_to post_path(@post.id)
  end

  def destroy
    @post = Post.find(params[:post_id])
    @post.dislikes_for(current_user).destroy_all
    @post.update_rating
    redirect_to post_path(@post.id)
  end
end
