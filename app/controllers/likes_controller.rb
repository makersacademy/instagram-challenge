class LikesController < ApplicationController

  def create
    @post = Post.find(params[:post_id])
    if @post.user_id != current_user.id
      @like = Like.create(post_id: @post.id, user_id: current_user.id)
      flash[:alert] = "You cannot like a post more than once" if !@like.save
    else
      flash[:alert] = "You cannot like your own post"
    end
    redirect_to posts_path
  end

end
