class LikesController < ApplicationController

  before_action :authenticate_user!

  def create
    @post = Post.find(params[:post_id])
    @like = @post.likes.build_with_user(current_user)
    if @like.save
      redirect_to posts_path
    else
      redirect_to posts_path, alert: 'You have already liked this post'
    end
  end

end
