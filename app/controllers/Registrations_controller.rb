class RegistrationsController < Devise::RegistrationsController

  protected

  def after_sign_up_path_for(resource)
	   images_path
  end
end
