class LikesController < ApplicationController

  def create
    @post = Post.find(params[:post_id])
    if @post.user_id != current_user.id
      Like.create(post_id: @post.id, user_id: current_user.id)
    else
      flash[:alert] = "You cannot like your own post"
    end
    redirect_to posts_path
  end

end
