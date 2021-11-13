class AccountsController < ApplicationController
  before_action :authenticate_account!

  def index
    #user feed of all posts
  end

  def show
    #user profile info (not in scope)
  end
end
