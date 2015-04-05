class LikesController < ApplicationController

  before_action :authenticate_user!, :except => [:index, :show]

  def new
    @post = Post.find(params[:post_id])
    @like = Like.new
  end

  def create
    @post = Post.find(params[:post_id])
    @post.likes.create
    flash[:notice] = 'Liked!'
    redirect_to posts_path
  end

end