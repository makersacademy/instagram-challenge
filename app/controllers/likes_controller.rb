class LikesController < ApplicationController
  before_action :set_photo

  # POST /likes
  def create
    # if @like
    #   @post.likes.where(like_params).destroy(@post.likes.where(user_id: params[:user_id]).ids)
    # else
    @like = @photo.likes.create(like_params)
    # end
    redirect_to @photo
  end

  private
    def set_photo
      @photo = Photo.find(params[:photo_id])
    end

    def like_params
      params.permit(:photo_id)
    end
end
