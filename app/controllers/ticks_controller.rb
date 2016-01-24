class TicksController < ApplicationController

  def create
    @post = Post.find(params[:post_id])
    @post.ticks.create
    redirect_to posts_path
  end

end
