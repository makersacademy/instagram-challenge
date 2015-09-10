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
    @post = Post.find(params[:post_id])
    @like = @post.likes.find_by(user_id: current_user.id)
    if @like.nil?
      redirect_to root_path
    else
      @like.destroy
      render json: { destroy_like_count: @post.likes.count }
    end
  end

end
