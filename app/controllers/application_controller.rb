class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  def home
    @photos = Photo.all
  end
  
end
