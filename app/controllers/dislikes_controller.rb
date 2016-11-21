class DislikesController < ApplicationController
  before_action :authenticate_user!

  def create
    @post = Post.find(params[:post_id])
    if @post.dislikes.where(user: current_user).empty?
      @post.dislikes.create(user: current_user)
      @post.update_rating
    end
    redirect_to post_path(@post.id)
  end
end
