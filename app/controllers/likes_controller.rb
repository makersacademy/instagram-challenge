class LikesController < ApplicationController

  def index
    create
  end

  def create
    @instapic = Instapic.find(params[:instapic_id])
    @instapic.likes.create
    render json: { new_like_count: @instapic.likes.count }
  end

end
