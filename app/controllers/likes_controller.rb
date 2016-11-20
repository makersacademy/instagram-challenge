class LikesController < ApplicationController
  # respond_to :html, :js

  def create
    @picture = Picture.find(params[:picture_id])
    @picture.likes.create
    if request.xhr?
      render json: { count: @picture.likes.size, id: @picture.id }
    else
      redirect_to '/pictures'
    end
  end
end
