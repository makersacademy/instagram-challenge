class SessionsController < ApplicationController
  def new
  end
  def create 
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in(user)
      redirect_to user_url(user.id)
      flash[:success] = 'You are signed in successfully'
    else 
      puts " "
      flash[:danger] = 'Invalid email/password combination' # Not quite right!
      redirect_to sessions_new_path
    end 
  end 



  def log_in(user)
    session[:user_id] = user.id
  end 


end
