class SessionsController < ApplicationController
  def new
  end

  def create
    find_and_get_user(params[:email], params[:password])
  end

  def destroy
    session[:user_id] = nil
    redirect_to sessions_new_path
  end
end
