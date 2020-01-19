class LikesController < ApplicationController
  def create
    Like.create({ user_id: session[:id], post_id: params[:id] })
    redirect_back fallback_location: root_path
  end

  def destroy
    Like.destroy(params[:id])
    redirect_back fallback_location: root_path
  end
end
