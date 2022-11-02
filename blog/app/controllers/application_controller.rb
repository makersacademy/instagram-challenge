class ApplicationController < ActionController::Base

def authorize
    redirect_to new_session_path, alert: "Not authorized" if current_user.nil?
  end
  
  private 
    def current_user
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end
  
    helper_method :current_user
  end

