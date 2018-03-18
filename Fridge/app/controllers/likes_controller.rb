class LikesController < ApplicationController

  def create
    p "*******"
    p "User ID"
    p params[:user_id]
    p "photo ID"
    p params[:photo_id]
    p "*******"

    @like = Like.new(like_params)
    if @like.save
      flash[:notice] = "Thank you for your like"
      redirect_to '/photos'
    else
      flash[:notice] = "Something went wrong"
      redirect_to '/photos'
    end
    # here I'll create a new like in the Likes database
    # having the data above.

    # Later I'll show likes on the website
    # and checkeced if a particular user haven't liked twice.
  end

  def like_params
    params.permit(:user_id, :photo_id)
  end

end
