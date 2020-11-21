class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  def new
  end
end
