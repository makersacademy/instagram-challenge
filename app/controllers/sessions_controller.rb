class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to photos_url, notice: "Logged in!" #need to change to redirect_to photos_url
    else
      flash[:alert] = "Email or password is invalid"
      render "index"  # need to change to render "index"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, alert: "Logged out!"
  end
end
