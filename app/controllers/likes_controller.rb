class LikesController < ApplicationController
  def create
    @image = Image.find(params[:image_id])
    if !current_user.has_liked?(@image)
      @like = @image.likes.create
      @like.user = current_user
      @like.save
      render json: {new_like_count: @image.likes.count}
    else
      # Why would we render new again?  What else could cause an error?
      render :new
    end
  end
end
