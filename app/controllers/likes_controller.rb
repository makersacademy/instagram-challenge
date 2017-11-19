class LikesController < ApplicationController
  def create
    p params
    @post = Post.find(params[:post_id])
    @like = @post.likes.create(post_id: params[:post_id], user_id: current_user.id)
    redirect_to request.referrer
  end

  def destroy
    @post = Post.find(params[:post_id])
    @like = @post.likes.where(post_id: params[:post_id], user_id: current_user.id)
    @like.destroy
    redirect_to request.referrer
  end

  private
  def like_params
    params.require(:like).permit(:user_id, :post_id)
  end
end
