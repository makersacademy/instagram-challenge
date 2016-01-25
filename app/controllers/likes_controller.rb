class LikesController < ApplicationController

  def create
    @picture = Picture.find(params[:picture_id])
    @like = @picture.build_like(current_user)
    if @like.save
      render json: {new_like_count: @picture.likes.count}
    else
      flash[:notice] = "Already liked"
      redirect_to :back
    end
  end

end
