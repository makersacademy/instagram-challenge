class ApplicationController < ActionController::Base
  before_action :authenticate_user!, :except => [:show, :index]
  protect_from_forgery with: :exception
end
