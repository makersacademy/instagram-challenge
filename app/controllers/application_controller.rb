class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  def home
    # @photos = Photo.all
    redirect_to "/photo/"
  end

end
