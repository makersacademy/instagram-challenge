class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    helper_method :current_user
    helper_method :logged_in?
  
    def current_user
      if !session[:user_id].to_s.strip.empty?
        existing_user = User.find_by(id: session[:user_id])
        if existing_user!=nil
          return existing_user
        end
        return
      end
      return
    end
  
    def logged_in?
      !current_user.nil?
    end
end
