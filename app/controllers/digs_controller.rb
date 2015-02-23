class DigsController < ApplicationController

  def create
    post = Post.find(params[:post_id])
    dig = Dig.new
    dig.user = current_user
    dig.post = post
    dig.save
    redirect_to('/')
    # render json: {new_dig_count: post.digs.count}
  end

end
