class SessionsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def new
    render file: Rails.public_path.join("templates","LogIn.html")
  end

  def create
    user = User.find_by(email: params[:email].downcase)
    if user && user.authenticate(params[:password])
      log_in(user)
      redirect_to("/users/#{user.id}")
    else
      redirect_to("/login")
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end
end
