class Users::RegistrationsController < Devise::RegistrationsController
    before_filter :update_sanitized_params

    def update_sanitized_params
       devise_parameter_sanitizer.for(:sign_up) {|u| u.permit(:username, :email,   :password, :password_confirmation)}
    end
end