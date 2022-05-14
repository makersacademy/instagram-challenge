class UsersController < ApplicationController
  def index
  end

  def new
  end

  def create
  end

  def show
    render 'devise/sessions/new'
  end
end
