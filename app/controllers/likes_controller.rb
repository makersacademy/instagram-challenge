class LikesController < ApplicationController

  def create
    @contribution = Contribution.find(params[:contribution_id])
    @contribution.likes.create
    render json: {new_like_count: @contribution.likes.count}
  end
end
