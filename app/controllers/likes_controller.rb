class LikesController < ApplicationController

  def new
    Like.new
  end

  def create
    Like.create(user_id: current_user.id, post_id: params[:format])

    redirect_to posts_url
  end

end
