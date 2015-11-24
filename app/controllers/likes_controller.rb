class LikesController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @like = @post.likes.create
    if @post.save
      @like.user_id = @post.id
      @like.save
    else
      flash[:notice] = "You've Already Liked This Post!"
    end
    render json: {new_like_count: @post.likes.count}
  end
end
