class TicksController < ApplicationController

  def create
    @post = Post.find(params[:post_id])
    @post.ticks.create
    render json: {new_tick_count: @post.ticks.count}
  end

end
