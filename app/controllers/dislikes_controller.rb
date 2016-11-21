class DislikesController < ApplicationController
  before_action :authenticate_user!
  
  def create
    @post = Post.find(params[:post_id])
    @post.dislikes.create
    @post.update_rating
    redirect_to post_path(@post.id)
  end
end
