class LikesController < ApplicationController

  def create
    post = Post.find(params[:post_id])
    post.likes.build(user_id: current_user.id)
    post.save
    redirect_to posts_path
  end

  private

  def like_params
    params.require(:like).permit(:user_id)
  end
end
