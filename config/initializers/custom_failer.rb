class CustomFailure < Devise::FailureApp
  
  def redirect_url
    new_user_session_url subdomain: 'secure'
  end

  def respond
    if http_auth?
      http_auth
    else
      flash[:alert] = "You need to be signed in to do that!"
      redirect_to images_path
    end
  end

end
