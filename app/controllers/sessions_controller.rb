class SessionsController < ApplicationController
  before_action :require_none, only: [:new]

   def new
   end

   def create
     @user = User.find_by_email(params[:session][:email])
     if @user && @user.authenticate(params[:session][:password])
       session[:user_id] = @user.id
       redirect_to pic_path
     else
       redirect_to user_session_path
     end
   end

   def destroy
     User.find(session[:user_id]).destroy
     session[:user_id] = nil
     redirect_to pic_path
   end
end
