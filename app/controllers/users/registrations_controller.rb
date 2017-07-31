class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [:create]

  protected

  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end

  # The path used after sign up.
  def after_sign_up_path_for(resource)
    "/users/#{resource.id}"
  end

end
