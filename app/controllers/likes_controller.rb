class LikesController < ApplicationController

  def save_like
    @like = Like.new(post_id: params[:post_id], account_id: current_account.id)
    @post_id = params[:post_id]

    respond_to do |format|
      format.js {
        @like.save
        render "posts/like"
      }
    end
  end
end