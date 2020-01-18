class SessionsController < ApplicationController
  def index; end

  def new; end

  def create
    current_user = User.find_by({ email: params[:email] })
    if current_user&.authenticate(params[:password])
      session[:id] = current_user.id
      redirect_to "/users/#{current_user.id}"
    else
      session[:invalid_login] = true
      redirect_to '/sessions/new'
    end
  end
end
