class WelcomeController < ApplicationController
  def index
    if current_user
      redirect_to '/profiles'
    end
  end
end
