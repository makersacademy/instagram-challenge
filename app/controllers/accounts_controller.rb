class AccountsController < ApplicationController
  before_action :authenticate_account!

  def index
    @posts = Post.all
  end

  def show
    #user profile info (not in scope)
  end
end
