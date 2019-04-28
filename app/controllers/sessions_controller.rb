class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      sign_in user
      flash[:sign_in_success] = "Congratulations Gran, you're signed in!"
      redirect_to '/posts'
    else
      flash[:sign_in_failure] = "Invalid email/password combination!"
      redirect_to '/login'
    end
  end

  def destroy
    sign_out
    flash[:sign_out_success] = "You're now signed out"
    redirect_to '/login'
  end
end
