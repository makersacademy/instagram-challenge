class LikesController < ApplicationController

  def create
    @post = Post.find(params[:post_id])
    @like = @post.likes.build_with_user(current_user)
    if @like.save
      render json: { new_like_count: @post.likes.count }
    else
      redirect_to posts_path
    end
  end

  def destroy
    @like = Like.find(params[:post_id])
    @like.destroy
    redirect_to posts_path
  end

end
