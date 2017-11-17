class HomeController < ApplicationController
  def index
    p current_user.id
  end
end
