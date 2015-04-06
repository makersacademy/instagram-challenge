class LikesController < ApplicationController

  before_action :authenticate_user!, :except => [:index]

  def new
    @post = Post.find(params[:post_id])
    @like = Like.new
  end

  def create
    @post = Post.find(params[:post_id])
    if current_user.liked_post? @post
       redirect_to posts_path
    else
      new_like = @post.likes.create(:user_id => current_user)
      new_like.user = current_user
      flash[:notice] = 'Post Liked!' if new_like.save
      redirect_to posts_path
    end
  end
end