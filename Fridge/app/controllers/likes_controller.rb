class LikesController < ApplicationController

  def self.all
    return Likes.all
  end

  def create
    @like = Like.new(like_params)
    if @like.save
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
