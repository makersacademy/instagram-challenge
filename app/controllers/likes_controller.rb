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
    if session[:user_id]
      @likes =
        Like.where(
          {
            post_id: like_params['post_id'].to_i,
            user_id: like_params['user_id'].to_i,
          },
        )
      Like.delete(@likes)
    end
    redirect_to home_url
  end

  private

  def like_params
    if session[:user_id]
      params[:like][:user_id] = session[:user_id]
    else
      params[:like][:user_id] = nil
    end
    params.require(:like).permit(:post_id, :user_id)
  end
end
