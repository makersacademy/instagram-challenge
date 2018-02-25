class LikesController < ApplicationController

  def create
    @post = Post.find(params[:post_id])
    @like = @post.likes.new
    @like.user_id = current_user.id
    @like.save
    flash[:notice] = "You liked this post!"
    redirect_to @post
  end

  def destroy
    @post = Post.find(params[:post_id])
    @like = @post.likes.find(params[:id])
    if User.find(@like.user_id) == current_user
      @like.destroy
    else
      flash[:notice] = "You may not delete this like"
    end
    redirect_to post_path(@post)
  end

end
