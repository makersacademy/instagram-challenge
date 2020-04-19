class LikesController < ApplicationController
  before_action :authenticate_account!

  def save_like
    @like = Like.new(post_id: params[:post_id], account_id: current_account.id) 
    @post_id = params[:post_id]
    respond_to do |format|
      format.js {
        if Like.where(post_id: params[:post_id], account_id: current_account.id).any?
          @success = false
        elsif @like.save
          @success = true
        else
          @success = false
        end

        render "posts/like"
        }
      end
  end

end
