class LikesController < ApplicationController

  def create
    @post = Post.find(params[:post_id])
    @like = @post.likes.create
    @like.user_id = current_user.id
    @like.save
    redirect_to @post
  end
  
  def destroy
    @post = Post.find(params[:post_id])
    @like = Like.find(params[:id])
    @like.destroy
    redirect_to @post
  end
end
