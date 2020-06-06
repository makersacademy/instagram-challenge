class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    p params
    # user = User.create(full_name: params[:full_name], username: params[:username], email: params[:email], password: params[:password])
    redirect_to '/sessions/new', notice: 'Account created successfully'
  end
end
