class LikesController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    if !current_user.has_liked? @post
      @like = @post.create_like(current_user)
      render json: { new_like_count: @post.likes.count }
    else
      flash[:notice] = "You can only like a post once"
      redirect_to "/posts"
    end
  end
end
