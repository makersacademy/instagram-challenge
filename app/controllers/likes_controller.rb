class LikesController < ApplicationController
  def new
    @like = Like.new(post_id: params[:post_id], user_id: params[:user_id])
    create
  end

  def create
    @like = Like.new(post_id: params[:post_id], user_id: params[:user_id])
      if @like.save
        redirect_to root_url
      else
        p 'something else'
    end
  end

  def destroy
    @like.destroy
    respond_to do |format|
      format.html { redirect_to root_url, notice: 'Like was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  # private
  # def like_params
  #   params.require(:post_id).merge(:post_id params[:post_id])
  # end

end
