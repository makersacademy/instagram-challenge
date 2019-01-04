class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id] = user.id
      flash[:success] = "Welcome back #{user.first_name}!"
      redirect_to posts_url
    else
      flash[:unable] = "Sign in unsuccessful!"
      redirect_to sign_in_url
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = "You have signed out!"
    redirect_to posts_url
  end
end
