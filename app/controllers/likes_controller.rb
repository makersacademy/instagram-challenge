class LikesController < ApplicationController

  before_action :authenticate_user!, :except => [:index, :show]

  def new
    @post = Post.find(params[:post_id])
    @like = Like.new
  end

  def create
    post = Post.find(params[:post_id])
    new_like = post.likes.create
    new_like.user = current_user
    flash[:notice] = 'Liked!' if new_like.save
    redirect_to posts_path
  end

  def destroy
    like = Like.find(params[:id])
    like.destroy
    flash[:notice] = 'Like deleted successfully'
    redirect_to '/posts'
  end

end