class FriendsController < ApplicationController
  def new; end

  def create
    if session[:user_id]
      if friend_params['user_id'] != friend_params['follow']
        @like = Friend.create(friend_params)
      end
    end
    redirect_to home_url
  end

  def destroy
    if session[:user_id]
      @friends =
        Friend.where(
          {
            user_id: friend_params['user_id'].to_i,
            follow: friend_params['follow'].to_i,
          },
        )

      Friend.delete(@friends)
    end
    redirect_to home_url
  end

  private

  def friend_params
    if session[:user_id]
      params[:friend][:user_id] = session[:user_id]
    else
      params[:friend][:user_id] = nil
    end
    params.require(:friend).permit(:follow, :user_id)
  end
end
