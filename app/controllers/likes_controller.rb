class LikesController < ApplicationController

  def create
    @post = Post.find(params[:post_id])
    if current_user.has_liked? @post
      @post.likes.destroy
    else
      @post.likes.create
    end
    redirect_to posts_path
  end

end
