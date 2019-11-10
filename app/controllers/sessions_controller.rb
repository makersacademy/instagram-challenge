class SessionsController < ApplicationController
  attr_reader :error

  def new
  end

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
     session[:user_id] = user.id
     redirect_to "/users/#{session[:user_id]}", notice: "Logged in!"
   else

     redirect_to '/'
     flash.notice = "Email or password is invalid"
   end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/'
    flash[:alert] = "You have been successfully logged out"
  end
end
