class WelcomeController < ApplicationController
  def index
    if user_signed_in?
      redirect_to posts_url
    end
  end
end
