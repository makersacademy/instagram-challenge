class TravelgramController < ApplicationController
  def index
    @adventures = Adventure.all
  end
end
