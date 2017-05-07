class ProfilesController < ApplicationController

  def index
    @profiles = Profile.all
  end
end
