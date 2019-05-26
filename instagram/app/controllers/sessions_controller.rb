class SessionsController < ApplicationController
  def new
  end

  def create
    email = params[:session][:email]
    password = params[:session][:password]
    user = User.find_by(email: email)
    if user && user.authenticate(password)
      log_in(user)
      redirect_to user
    else   
      flash[:alert] = ['Sorry, your password was incorrect.','Please double-check your password.']
      render 'new'
    end
  end
end
