class LikesController < ApplicationController
  #before_action :set_like, only: [:show, :edit, :update, :destroy]
  before_action :set_photo

  # POST /likes
  # POST /likes.json
  def create
    # if @like
    #   @post.likes.where(like_params).destroy(@post.likes.where(user_id: params[:user_id]).ids)
    # else
    @like = @photo.likes.create(like_params)
    # end
    redirect_to @photo, notice: 'Liked'
  end

  # DELETE /likes/1
  # DELETE /likes/1.json
  # def destroy
  #   if @like.destroy
  #     redirect_to likes_url, notice: 'Unliked'
  #   end
  # end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_photo
      @photo = Photo.find(params[:photo_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def like_params
      params.permit(:photo_id)
    end
end
