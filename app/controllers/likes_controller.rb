class LikesController < ApplicationController

  def create
    @like = Like.find_by(post_id: params[:post_id], user_id: current_user.id)
    if !@like
      @like = Like.create(post_id: params[:post_id],
                          user_id: current_user.id)
    else
      flash[:post_id] = params[:post_id]
      flash[:notice] = "You already liked this photo!"
    end
    redirect_to posts_path
  end


end
