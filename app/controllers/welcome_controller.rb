class WelcomeController < ApplicationController
  def home
  end

  def images
    if session[:user_id] == nil
      redirect_to welcome_home_url 
    end
    @user = User.find_by(id: session[:user_id])
  end
end
