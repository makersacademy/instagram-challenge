class HomeController < ApplicationController
  skip_before_action :authenticate_user!, :only => [:index]

  def index
    if current_user
      :index
    else
      render 'devise/registrations/new'
    end
  end
end
