class RegistrationsController < Devise::RegistrationsController
  
  private 

  def sign_up_params
    params.require(:user).permit(:email, :user_name, :password, :password_confirmation)
  end

  def account_update_params
    params.require(:user).permit(:email, :user_name, :password, :password_confirmation, :current_password)
  end

  protected 
  
  def update_resource(resource, params)
    resource.update_without_password(params)
  end

end