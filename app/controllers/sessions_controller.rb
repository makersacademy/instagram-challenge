class SessionsController < ApplicationController
  include SessionsHelper
  # to keep useful functions and variables seperate from controller,
  # we require in these helpers.

  def new #for the GET request to the login page
  end

  def create #for the POST request 'to' the login page
    @user = User.find_by(email: params[:email].downcase)
    if @user && @user.authenticate(params[:password])
      log_in(@user)
      handle = @user.handle.to_s
      redirect_to root_url, notice: "Logged in. Welcome back, #{handle}!"
    else
      flash[:alert] = "wrong email/password combination "
      render 'new'
    end
  end

  def destroy #for the DELETE request to the logout page
  end


end

# this was made manually, not scaffolded, because sessions are temporary
# and don't require the entire CRUD setup/
