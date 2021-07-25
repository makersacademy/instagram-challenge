class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  # before_action :require_login

    # def require_login
    #   unless current_user
    #     redirect_to signin_url
    #   end
    # end
end
