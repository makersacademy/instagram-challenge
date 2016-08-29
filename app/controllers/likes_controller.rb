class LikesController < ApplicationController

  def create
    @photograph = Photograph.find(params[:photograph_id])
    @photograph.likes.create_with_user({}, current_user)
    render json: { new_likes_count: @photograph.likes.size }
  end

end
