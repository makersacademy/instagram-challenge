class UsersController < ApplicationController

  def index
    @users_email = User.email.all
  end
end
