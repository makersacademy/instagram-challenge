class LikesController < ApplicationController
  def create
    @like = Like.new(like_params)

    respond_to do |format|
      if @like.save
        format.html { redirect_to request.referer, notice: "You liked this post" }
      else
        format.html { redirect_to request.referer, notice: "Something went wrong :(" }
      end
    end
  end

  def destroy
    like = Like.find_by(user_id: like_params[:user_id], post_id: like_params[:post_id])
    like.destroy
    respond_to do |format|
      format.html { redirect_to request.referer, notice: "You unliked this post" }
    end
  end

  private

  def like_params
    params.permit(:user_id, :post_id)
  end
end
