class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  def index
    if current_user
      flash.now[:signed_up] = "Signup successful, welcome #{current_user.email}"
    end
  end
end
