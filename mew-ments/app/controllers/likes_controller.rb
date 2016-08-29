class LikesController < ApplicationController
  def create
    @mewment = Mewment.find(params[:mewment_id])
    @mewment.likes.create
    render json: {new_like_count: @mewment.likes.count}
  end
end
