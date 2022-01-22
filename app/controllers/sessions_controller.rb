class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in(user)
      flash[:success] = "Logged in as #{user.name}"
      redirect_to posts_path
    else
      flash.now[:danger] = "Invalid login credentials."
      render 'new'
    end
  end

  def destroy
    log_out
    flash[:success] = "Successfully logged out"
    redirect_to root_path
  end

end
