class Hipsters::OmniauthCallbacksController < Devise::OmniauthCallbacksController


 def facebook
    @user = Hipster.from_omniauth(request.env["omniauth.auth"])
    if @user.persisted?
      sign_in_and_redirect @user, :event => :authentication
      set_flash_message(:notice, :success, :kind => "Facebook") if is_navigation_format?
    else
      session["devise.facebook_data"] = request.env["omniauth.auth"]
      redirect_to_new_user_registration_url
    end
  end

  

  def failure
    redirect_to root_path
  end




end
