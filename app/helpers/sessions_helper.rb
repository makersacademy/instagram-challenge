module SessionsHelper
#this file is required into the sessions controller.

# these allow us to do log_in and also,
# to reference the current_user as an object

  def log_in(user)
    #gives a new kvp to sessions object
    session[:user_id] = user.id
  end

  def current_user #getter method
    if session[:user_id]
      @current_user ||= User.find_by(id: session[:user_id])
    end
  end

end
