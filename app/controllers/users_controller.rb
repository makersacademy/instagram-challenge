class UsersController < ApplicationController
  before_action :authenticate_user!


  def index
    # user feed
  end

  def show 
    # user profile
  end

end
