class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_filter :configure_permitted_parameters, if: :devise_controller?

  protected
  def configure_permitted_parameters
    added_attrs = [:username, :email, :password, :password_confirmation, :remember_me]
  end
end
