class LikesController < ApplicationController
  before_action :authenticate_account!
  
  def save_like
    @like = Like.new(post_id: params[:post_id], account_id: current_account.id)
      
    respond_to do |format|
      format.json {
        if @like.save
          render dashboard_path, flash: { success: true }
        else
          { success: false }
        end
        }
      end
  end

end
