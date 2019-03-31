class LikesController < ApplicationController

  def create
    like = Like.create(user_id: current_user.id, post_id: params[:post_id])
    # like.save
    redirect_to '/posts'
  end
end
