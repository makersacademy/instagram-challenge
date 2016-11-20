class InstagramController < ApplicationController
  
   before_action :authenticate_user!, :except => [:index]

  def index
    @pictures = Picture.all
  end


end
