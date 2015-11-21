class LikesController < ApplicationController

  def create
    @post = Post.find(params[:post_id])
    if current_user.has_liked? @post
      like = @post.likes.find_by(user_id: current_user.id)
      current_user.likes.destroy(like)
    else
      current_user.likes.create(post_id: params[:post_id])
    end
    redirect_to posts_path
  end

end
