class ApplicationController < ActionController::Base
    helper_method :current_user_session, :current_user
    helper_method :display_post_time

    private

    def require_user
      unless current_user
        flash[:notice] = "You must be logged in to access this page"
        redirect_to new_user_session_path
        return false
      end
    end

    def require_user_admin
      unless current_user.admin
        flash[:notice] = "You must be logged in as admin to access this page"
        redirect_to new_user_session_path
        return false
      end
    end

    def display_post_time(time_at_post)
      time_diffrences = Time.now() - time_at_post
      seconds_in_hour = 3600
  
      if time_diffrences < seconds_in_hour
        if time_diffrences < 60
          time_diffrences.to_i.to_s.+(" seconds ago")
        else
          time_diffrences./(60).to_i.to_s.+(" minutes ago")
        end
      elsif time_at_post == Date.today
        time_at_post.strftime("%H:%M")
      else 
        time_at_post.strftime("%Y-%m-%d")
      end
  
    end

    def current_user_session
      return @current_user_session if defined?(@current_user_session)
      @current_user_session = UserSession.find
    end

    def current_user
      return @current_user if defined?(@current_user)
      @current_user = current_user_session && current_user_session.user
    end
end
