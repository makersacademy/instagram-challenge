class HomeController < ApplicationController

  def index
    @user = current_user || nil
    @pictures = Picture.all
  end
end
