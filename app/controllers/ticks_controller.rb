class TicksController < ApplicationController
  before_action :authenticate_user!
  def create
    @post = Post.find(params[:post_id])
    @post.ticks.create
    render json: {new_tick_count: @post.ticks.count}
  end

end
