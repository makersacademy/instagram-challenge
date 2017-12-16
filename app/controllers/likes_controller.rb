class LikesController < ApplicationController
  def create
    Like.create(clicked: params[:like], image_id: params[:image_id])
  end
end
