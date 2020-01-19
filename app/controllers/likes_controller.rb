class LikesController < ApplicationController
  def create
    @like = Like.new(like_params)
    @like.save
    redirect_to root_path
  end

  def destroy
    Like.find(params[:id]).destroy
    redirect_to root_path
  end

  private
  
  def like_params
    params.require(:like).permit(:user_id, :fatcat_id)
  end
end
