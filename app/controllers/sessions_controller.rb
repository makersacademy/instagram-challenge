class SessionsController < ApplicationController
  def new

  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)

    if user && user.authenticate(params[:session][:password])
      log_in user
      redirect_to :pictures
    else
      #create error message
      render :new
    end
  end

  def destroy
    log_out
    redirect_to :root
  end

end
