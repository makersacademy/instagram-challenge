class AccountsController < ApplicationController
  before_action :authenticate_account!
  def index
    @post = Post.active
  end
  def show
  end   
end
