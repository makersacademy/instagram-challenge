class LikesController < ApplicationController

  def create
    @post = Post.find(params[:post_id])
    @like = @post.likes.create
    @like.user = current_user
    if @post.save
      redirect_to posts_path
    else
      redirect_to posts_path
    end
  end

end
