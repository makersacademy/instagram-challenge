class HomeController < ApplicationController
  def index
    @picture = current_user.pictures.build if user_signed_in?
  end 
end
