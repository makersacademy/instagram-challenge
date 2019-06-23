class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:notice] = 'You have signed in'
      redirect_to '/'
    else
      flash[:notice] = 'Email or password is incorrect'
      redirect_to '/signin'
    end
  end
  #
  # def destroy
  # end
end
