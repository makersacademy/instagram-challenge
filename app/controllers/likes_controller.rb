class LikesController < ApplicationController

  def new    
  end

  def create
    @post = Post.find(params[:post_id])
    if (current_user && current_user.id == @post.user_id)
      redirect_to post_path(@post), alert: "You cannot like your own post."
    elsif (current_user)
      @like = @post.likes.new
      @like.user = current_user
      @like.save
      redirect_to post_path(@post), notice: "You liked the post."
    else
      redirect_to post_path(@post), alert: "You must login to continue."
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    @like = Like.find(params[:id])
    @like.destroy
    redirect_to post_path(@post), notice: "You unliked the post."
  end

end
