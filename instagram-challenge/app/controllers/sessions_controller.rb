class SessionsController < ApplicationController
  def new
  end
  def create 
    puts " in create method"
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in(user)
      puts "user matches"
      p user
      redirect_to user_url(user.id)
    else 
      puts " "
      puts "user does not match"
    end 
  end 


  def log_in(user)
    session[:user_id] = user.id
  end 

end
