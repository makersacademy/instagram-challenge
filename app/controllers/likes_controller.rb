class LikesController < ApplicationController
  def new; end

  def create
    if session[:user_id]
      post_object = Post.find(like_params['post_id'].to_i)
      if post_object&.user_id.to_s != session[:user_id]
        @like = Like.create(like_params)
      end
    end
    redirect_to home_url
  end

  def destroy
    redirect_to home_url unless session[:user_id]
    @likes =
      Like.where(
        {
          post_id: like_params['post_id'].to_i,
          user_id: like_params['user_id'].to_i,
        },
      )
    Like.delete(@likes)
    redirect_to home_url
  end

  private

  def like_params
    params.require(:like).permit(:user_id, :post_id)
  end
end
