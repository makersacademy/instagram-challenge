class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(username: params[:session][:username])
    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      redirect_to '/posts'
    else
      render 'new'
    end
  end

  def destroy
    session.delete(:user_id)
    @user = nil
    redirect_to '/posts'
  end
end
