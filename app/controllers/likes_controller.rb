class LikesController < ApplicationController

  def create
    @like = Like.new(like_params)
    if Like.where(["photo_id = ? and user_id = ?", "#{like_params[:photo_id]}", "#{like_params[:user_id]}"]).count == 0 then
      @like.save
      flash[:notice] = "Thank you for your like"
      redirect_to '/photos'
    else
      flash[:notice] = "Something went wrong"
      redirect_to '/photos'
    end
  end

  def like_params
    params.permit(:user_id, :photo_id)
  end

end
