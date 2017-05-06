class TravelgramsController < ApplicationController
  def index
    @adventures = Travelgram.all
  end

  def new
    @adventure = Travelgram.new
  end

  def create
    @adventure = Travelgram.create(travelgram_params)
    redirect_to '/travelgrams'
  end

  def travelgram_params
    params.require(:travelgram).permit(:name)
  end
end
