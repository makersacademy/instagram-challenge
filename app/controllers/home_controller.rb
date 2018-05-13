class HomeController < ActionController::Base
  before_action :authenticate_user!

  def index
    redirect_to posts_path
  end
end
