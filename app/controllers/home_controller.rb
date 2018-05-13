class HomeController < ApplicationController
  def index
    @picture = current_user.pictures.build if user_signed_in?
    @picture_feed = Picture.last(25)
  end 
end
