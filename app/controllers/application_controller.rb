class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  helper_method :current_user

  def authorize
    redirect_to root_path
  end

  def find_and_get_user(email, password)
    user = User.find_by(email: email)
    if user && user.authenticate(password)
      session[:user_id] = user.id
      flash[:message] = "Welcome #{user.name} you are now signed in!"
      redirect_to root_path
    else
      flash[:message] = "Your details were not recognized please try again"
      render 'sessions/new'
    end
  end

end
