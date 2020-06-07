class SessionsController < ApplicationController
  def new
  end

  def create
    p params
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      redirect_to '/pictures', notice: `Welcome #{user.full_name}`
    else
      redirect_to sessions_new_path, notice: 'Wrongs email/password details'
    end
  end
end
