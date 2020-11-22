class AccountsController < ApplicationController
  before_action :authenticate_account!

  def index
    # acts as dashboard - post feed
    # restrict to logged in users
    @posts = Post.active 
  end

  def show
    # user profile
  end
end
