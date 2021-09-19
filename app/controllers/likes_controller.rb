class LikesController < ApplicationController
  def new; end

  def create
    unless session[:user_id] &&
             (session[:user_id].to_i != like_params['user_id'].to_i)
      redirect_to home_url
    else
      @like = Like.create(like_params)
      redirect_to home_url
    end
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
