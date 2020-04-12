class AccountsController < ApplicationController
  before_action :authenticate_account!
  before_action :set_account, only: [:profile]
 
  def index
    # user dashboard - postfeed
    @posts = Post.active
  end

  def profile
    # user profile

  end

  def set_account
    @account = Account.find_by_username(params[:username])
  end

end
