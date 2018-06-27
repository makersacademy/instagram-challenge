class WelcomeController < ApplicationController
  def index
    if user_signed_in?
      @user = current_user
      redirect_to photos_path
    end
  end
end
