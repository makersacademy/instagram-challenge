class UserController < ApplicationController
  def create
    @user = User.new
    @user.name = "glitter_spikes"
    @user.email = "glitter_spikes@gmail.com"

    @user.save
end
