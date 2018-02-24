class WelcomeController < ApplicationController

  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
  end
end
