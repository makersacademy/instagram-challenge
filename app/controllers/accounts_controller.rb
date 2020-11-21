class AccountsController < ApplicationController
  before_action :authenticate_account!

  def index
    # acts as dashboard
    # restrict to logged in users
  end

  def show
    # user profile
  end
end
