class LikesController < ApplicationController

  def create
    like = Like.where(:user_id => current_user.id, :post_id => params[:post_id])
    if !like.nil?
      Like.create(user_id: current_user.id, post_id: params[:post_id])
    end
    redirect_to '/posts'
    
  end
end
