class ApplicationController < ActionController::Base
  include SessionsHelper
  include LikesHelper

  def store_location(location)
    session[:return_to] = location
  end

  def redirect_back_to
    redirect_to session[:return_to]
    session[:return_to] = nil
  end
end
