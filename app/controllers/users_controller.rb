class UsersController < ApplicationController
  def profile
    @user = Current.user
  end
end
