class LikesController < ApplicationController

  def new
    @post = Post.find(params[:post_id])
    @like = Like.new
  end

  def create
    @post = Post.find(params[:post_id])
    @like = @post.likes.new
    @like.user = current_user
    @like.save
    redirect_to post_path(@post), notice: "You liked the post."
  end

  def destroy
    @post = Post.find(params[:post_id])
    @like = Like.find(params[:id])
    @like.destroy
    redirect_to post_path(@post), notice: "You unliked the post."
  end

end
