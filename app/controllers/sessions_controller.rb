class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id] = user.id
      redirect_to posts_url
    else
      redirect_to sign_in_url
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to posts_url
  end
end
