class HomeController < ApplicationController
  def index
    redirect_to posts_path if current_user
  end
end
