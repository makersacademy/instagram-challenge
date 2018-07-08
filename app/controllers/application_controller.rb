class ApplicationController < ActionController::Base

  before_action :authenticate_user!
  def hello
    render html: "Hello, world!!!"
  end
end
